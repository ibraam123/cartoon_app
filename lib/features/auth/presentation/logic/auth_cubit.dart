import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/error.dart';
import '../../data/models/user_model.dart';
import '../../data/repo/user_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._auth,
      this._userRepository
  ) : super(AuthInitial()){
    checkAuthStatus();
  }

  final FirebaseAuth _auth;
  final UserRepository _userRepository;
  SharedPreferences? _prefs;
  bool rememberMe = false;


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

  Future<SharedPreferences> _getPrefs() async => _prefs ??= await SharedPreferences.getInstance();

  Future<void> _cacheUser(UserModel user) async {
    final prefs = await _getPrefs();
    await prefs.setString('firstName', user.firstName);
    await prefs.setString('lastName', user.lastName);
    await prefs.setString('email', user.email);
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
      emit(ForgotPasswordError((
      FailureHandler.mapException(e)
      )));
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading(
      action: AuthAction.email
    ));
    try {
      final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
      final uid = cred.user!.uid;


      final user = await _userRepository.getUser(uid);
      await _cacheUser(user);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthError(
      FailureHandler.mapException(e)
      ));
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(AuthLoading(
      action: AuthAction.signup
    ));
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
      emit(AuthError(
      FailureHandler.mapException(e)
      ));
    }
  }

  Future<void> _clearUserCache() async {
    final prefs = await _getPrefs();
    await prefs.remove('firstName');
    await prefs.remove('lastName');
    await prefs.remove('email');
  }

  Future<void> signOut() async {
    emit(AuthLoading(
      action: AuthAction.logout
    ));
    try {
      await _auth.signOut();
      await _clearUserCache();
      emit(AuthLogout());
    } catch (e) {
      emit(AuthError(
      FailureHandler.mapException(e)
      ));
    }
  }
}
