import 'package:cartoon_app/core/config/app_colors.dart';
import 'dart:math';
import 'package:cartoon_app/features/onboarding/models/onboarding_model.dart';
import 'package:cartoon_app/features/onboarding/widgets/onbaording_image.dart';
import 'package:cartoon_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../core/config/routes.dart';
import '../widgets/onboarding_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OnBoardingModel> onboardingList = [
      OnBoardingModel(
        icon: Icons.menu_book_rounded,
        imageAssets: Assets.imagesOnboarding1,
        title: "Learn with Fun",
        description:
            "Explore exciting lessons designed for Egyptian students from KG to Secondary",
      ),
      OnBoardingModel(
        icon: Icons.play_arrow_outlined,
        imageAssets: Assets.imagesOnboarding3,
        title: "Animated Lessons",
        description:
            "Watch fun educational videos that make learning easy and enjoyable",
      ),
      OnBoardingModel(
        icon: Icons.emoji_events_outlined,
        imageAssets: Assets.imagesOnboarding2,
        title: "Interactive Quizzes",
        description:
            "Test your knowledge with fun quizzes and earn rewards and badges",
      ),
    ];
    final List<Color> colors = [
      AppColors.primary,
      Colors.orange,
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.red,
    ];
    final Random random = Random();

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      // BUILD PAGES DYNAMICALLY
      pages: onboardingList.map((item) {
        return PageViewModel(
          title: item.title,
          body: item.description,
          image: OnBoardingImage(imagePath: item.imageAssets, icon: item.icon , colorIcon: colors[random.nextInt(colors.length)],),
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyTextStyle: TextStyle(fontSize: 16.sp, color: Colors.black54),
            imagePadding: EdgeInsets.only(top: 20.h),
            contentMargin: EdgeInsets.symmetric(horizontal: 16.w),
          ),
        );
      }).toList(),

      dotsDecorator: DotsDecorator(
        activeColor: AppColors.primary,
        activeSize: Size(30.w, 10.h),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),

      showSkipButton: true,
      skip: const Text(
        "Skip",
        style: TextStyle(
          fontSize: 16, // No need for .sp here as it's a constant
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),

      next: OnBoardingButton(
        text: "Next",
        icon: Icons.arrow_forward,
      ),

      done: OnBoardingButton(
        text: "Done",
        isDone: true,
      ) ,
      onDone: () {
        GoRouter.of(context).go(AppRoutes.kAuth);
      },
    );
  }
}

