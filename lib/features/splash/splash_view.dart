import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:go_router/go_router.dart';

import '../../core/config/routes.dart';
import '../auth/presentation/logic/auth_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      _navigateAfterSplash();
    });
  }
  Future<void> _navigateAfterSplash() async {
    if (!mounted) return;

    final authCubit = context.read<AuthCubit>();

    // Wait for auth status to be checked
    await authCubit.checkAuthStatus();

    // Give a small delay to ensure state is updated
    await Future.delayed(const Duration(milliseconds: 100));

    if (!mounted) return;

    // Listen to the current state after checkAuthStatus completes
    final currentState = authCubit.state;

    if (currentState is AuthSuccess && currentState.user != null) {
      // User is logged in - go to main screen
      GoRouter.of(context).go(AppRoutes.kSignInView);
    } else {
      // User is not logged in - go to sign up
      GoRouter.of(context).go(AppRoutes.kSignInView);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Image.asset(
        'assets/icons/icon.png',
        fit: BoxFit.contain,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
