import 'package:cartoon_app/core/theme/theme_cubit.dart';
import 'package:cartoon_app/features/home/preseantation/logic/profile_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/auth/data/repo/user_repo.dart';
import 'features/auth/domain/repo/user_repo_impl.dart';
import 'features/auth/presentation/logic/auth_cubit.dart';
final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton<FirebaseAuth>(
        () => FirebaseAuth.instance,
  );
  serviceLocator.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance,
  );

  serviceLocator.registerLazySingleton<GoogleSignIn>(
        () => GoogleSignIn.instance,
  );
  serviceLocator.registerLazySingleton<FacebookAuth>(
        () => FacebookAuth.instance,
  );

  serviceLocator.registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(serviceLocator<FirebaseFirestore>()),
  );

  serviceLocator.registerFactory<AuthCubit>(
        () => AuthCubit(
      serviceLocator<FirebaseAuth>(),
      serviceLocator<UserRepository>(),
          serviceLocator<GoogleSignIn>(),
          serviceLocator<FacebookAuth>(),
    ),
  );

  serviceLocator.registerFactory<ProfileCubit>(
        () => ProfileCubit(),
  );
  serviceLocator.registerFactory<ThemeCubit>(
        () => ThemeCubit(),
  );

}