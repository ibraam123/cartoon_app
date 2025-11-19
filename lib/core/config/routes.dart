import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/splash/splash_view.dart';

class AppRoutes {

  static const String kSplashView = '/';
  static const String kSignUpView = '/signUp';
  static const String kSignInView = '/signIn';
  static const String kForgetPasswordView = '/forgetPassword';

  static final GoRouter router = GoRouter(
    initialLocation: kSplashView,
    routes: <GoRoute>[
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kSignInView,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: kForgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
    ],
  );
}
