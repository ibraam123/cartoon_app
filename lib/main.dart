import 'package:cartoon_app/core/theme/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/config/bloc_observer.dart';
import 'core/config/routes.dart';
import 'core/config/theme.dart';
import 'core/helpers/cache_helper.dart';
import 'features/auth/presentation/logic/auth_cubit.dart';
import 'features/home/preseantation/logic/profile_cubit.dart';
import 'firebase_options.dart';
import 'init_dependcies.dart';

Future<void> main() async {

  

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await CacheHelper.init();

  await EasyLocalization.ensureInitialized();

  await init();



  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await serviceLocator.allReady();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => serviceLocator<AuthCubit>()),
            BlocProvider(create: (context) => serviceLocator<ProfileCubit>()),
            BlocProvider(create: (context) => serviceLocator<ThemeCubit>()),
          ],
          child: const AppView(),
        );
      },
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: AppRoutes.router,
          theme: AppTheme.lightTheme,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          debugShowCheckedModeBanner: false,
          themeMode: state.themeMode,
          title: 'Cartoon App',
          darkTheme: AppTheme.darkTheme,
          themeAnimationDuration: const Duration(milliseconds: 300),
          themeAnimationCurve: Curves.easeInOut,
        );
      }
    );
  }
}
