import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/error.dart';
import '../../data/models/user_model.dart';
import '../../data/repo/user_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._auth,
    this._userRepository,
    this._googleSignIn,
    this._facebookAuth,
  ) : super(AuthInitial()) {
    checkAuthStatus();
  }

  final FirebaseAuth _auth;
  final UserRepository _userRepository;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  SharedPreferences? _prefs;
  bool rememberMe = false;

  String get fullName {
    if (state is AuthSuccess) {
      final user = (state as AuthSuccess).user;
      final firstName = user?.firstName ?? '';
      final lastName = user?.lastName ?? '';
      final capitalizedFirstName = firstName.isNotEmpty ? '${firstName[0].toUpperCase()}${firstName.substring(1)}' : '';
      final capitalizedLastName = lastName.isNotEmpty ? '${lastName[0].toUpperCase()}${lastName.substring(1)}' : '';
      return "$capitalizedFirstName $capitalizedLastName".trim();
    }
    return "";
  }


  Future<void> checkAuthStatus() async {
    emit(AuthLoading());
    try {
      // Check if user is already signed in with Firebase
      final currentUser = _auth.currentUser;

      if (currentUser != null) {
        // User is signed in with Firebase, get user data
        final user = await _userRepository.getUser(currentUser.uid);
        emit(AuthSuccess(user: user));
      } else {
        // No user signed in, check if we have cached data (for "Remember Me")
        final prefs = await _getPrefs();
        final remembered = prefs.getBool("remember_me") ?? false;

        if (remembered) {
          // Try to get cached user data
          final cachedFirstName = prefs.getString('firstName');
          final cachedLastName = prefs.getString('lastName');

          if (cachedFirstName != null && cachedLastName != null) {
            // We have cached data but no Firebase user - user needs to sign in again
            emit(AuthUnauthenticated()); // We need to add this state
          } else {
            emit(AuthInitial());
          }
        } else {
          emit(AuthInitial());
        }
      }
    } catch (e) {
      emit(AuthError(FailureHandler.mapException(e)));
    }
  }

  Future<void> loadRememberMe() async {
    final prefs = await _getPrefs();
    rememberMe = prefs.getBool("remember_me") ?? false;
    emit(RememberMe(isSelected: rememberMe));
  }

  Future<void> toggleRememberMe(bool value) async {
    final prefs = await _getPrefs();
    await prefs.setBool("remember_me", value);
    rememberMe = value;
    emit(RememberMe(isSelected: value));
  }

  Future<SharedPreferences> _getPrefs() async =>
      _prefs ??= await SharedPreferences.getInstance();

  Future<void> _cacheUser(UserModel user) async {
    final prefs = await _getPrefs();
    await prefs.setString('firstName', user.firstName);
    await prefs.setString('lastName', user.lastName);
    await prefs.setString('email', user.email);
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading(action: AuthAction.google));
    try {
      UserCredential userCred;

      // Mobile/Desktop: google_sign_in v7
      await _googleSignIn.initialize(
        clientId:
            "1015696421423-th7o6o7iekmqanad9c9oood4jktnsp82.apps.googleusercontent.com",
      );

      final account = await _googleSignIn.authenticate();
      final idToken = (account.authentication).idToken;
      if (idToken == null) throw Exception('Google idToken was null');

      final credential = GoogleAuthProvider.credential(idToken: idToken);
      userCred = await _auth.signInWithCredential(credential);

      final firebaseUser = userCred.user!;
      UserModel user;

      try {
        // ✅ حاول تجيب اليوزر من الريبو
        user = await _userRepository.getUser(firebaseUser.uid);
      } catch (_) {
        // لو مش موجود، أنشئ واحد جديد
        final parts = (firebaseUser.displayName ?? '').trim().split(' ');
        user = UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          firstName: parts.isNotEmpty ? parts.first : '',
          lastName: parts.length > 1 ? parts.sublist(1).join(' ') : '',
        );
        await _userRepository.updateUser(user);
      }
      await _cacheUser(user);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthError(FailureHandler.mapException(e)));
    }
  }

  Future<void> signInWithFacebook() async {
    emit(AuthLoading(action: AuthAction.facebook));
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await _facebookAuth.login();

      if (loginResult.status == LoginStatus.success) {
        final facebookAccessToken = loginResult.accessToken;
        if (facebookAccessToken == null) {
          throw Exception('Facebook login failed: Access token was null.');
        }

        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(facebookAccessToken.tokenString);

        // Once signed in, get the UserCredential
        final userCredential = await _auth.signInWithCredential(
          facebookAuthCredential,
        );
        final firebaseUser = userCredential.user!;
        UserModel user;

        try {
          // Try to get the user from the repository
          user = await _userRepository.getUser(firebaseUser.uid);
        } catch (_) {
          // If the user doesn't exist, create a new one
          final userData = await _facebookAuth.getUserData();
          final nameParts = (userData['name'] as String? ?? '').split(' ');

          user = UserModel(
            id: firebaseUser.uid,
            email: userData['email'] as String? ?? firebaseUser.email ?? '',
            firstName: nameParts.isNotEmpty ? nameParts.first : '',
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          );
          await _userRepository.updateUser(user);
        }
         await _cacheUser(user);
         emit(AuthSuccess(user: user));
      } else {
        // Handle other login statuses like cancelled or failed
        throw Exception('Facebook login failed: ${loginResult.message}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during Facebook sign-in: $e');
      }
      emit(AuthError(FailureHandler.mapException(e)));
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    emit(ForgotPasswordLoading());
    if (email.isEmpty) {
      emit(const ForgotPasswordError('Please enter your email address'));
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email.trim());

      emit(ForgotPasswordSuccess());
    } catch (e) {
      emit(ForgotPasswordError((FailureHandler.mapException(e))));
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading(action: AuthAction.email));
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = cred.user!.uid;

      final user = await _userRepository.getUser(uid);
      await _cacheUser(user);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthError(FailureHandler.mapException(e)));
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(AuthLoading(action: AuthAction.signup));
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
      );
      await _userRepository.updateUser(user);
      await _cacheUser(user);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthError(FailureHandler.mapException(e)));
    }
  }

  Future<void> _clearUserCache() async {
    final prefs = await _getPrefs();
    await prefs.remove('firstName');
    await prefs.remove('lastName');
    await prefs.remove('email');
  }

  Future<void> signOut() async {
    emit(AuthLoading(action: AuthAction.logout));
    try {
      await _auth.signOut();
      await _clearUserCache();
      emit(AuthLogout());
    } catch (e) {
      emit(AuthError(FailureHandler.mapException(e)));
    }
  }
}
