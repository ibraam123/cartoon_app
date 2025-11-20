import 'package:cartoon_app/features/home/preseantation/views/main_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/auth_test_view.dart';
import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/onboarding/views/onboarding_view.dart';
import '../../features/splash/splash_view.dart';

class AppRoutes {

  static const String kSplashView = '/';
  static const String kSignUpView = '/signUp';
  static const String kSignInView = '/signIn';
  static const String kForgetPasswordView = '/forgetPassword';
  static const String kOnboardingView = '/onboarding';
  static const String kAuth = '/auth';
  static const String kMain = '/main';

  static final GoRouter router = GoRouter(
    initialLocation: kSplashView,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: 'forgetPassword',
        path: kForgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kAuth,
        builder: (context, state) => const AuthTestView(),
      ),
      GoRoute(
        path: kMain,
        builder: (context, state) => const MainView(),
      ),
    ],
  );
}
