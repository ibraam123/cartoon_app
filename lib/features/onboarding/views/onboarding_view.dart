import 'package:cartoon_app/core/config/app_colors.dart';
import 'package:cartoon_app/core/config/app_keys_localization.dart';
import 'dart:math';
import 'package:cartoon_app/features/onboarding/models/onboarding_model.dart';
import 'package:cartoon_app/features/onboarding/widgets/onbaording_image.dart';
import 'package:cartoon_app/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
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
    final theme = Theme.of(context);
    final List<OnBoardingModel> onboardingList = [
      OnBoardingModel(
        icon: Icons.menu_book_rounded,
        imageAssets: Assets.imagesOnboarding1,
        title: OnboardingKeys.page1Title.tr(),
        description:
            OnboardingKeys.page1Desc.tr(),
      ),
      OnBoardingModel(
        icon: Icons.play_arrow_outlined,
        imageAssets: Assets.imagesOnboarding3,
        title: OnboardingKeys.page2Title.tr(),
        description: OnboardingKeys.page2Desc.tr(),
      ),
      OnBoardingModel(
        icon: Icons.emoji_events_outlined,
        imageAssets: Assets.imagesOnboarding2,
        title: OnboardingKeys.page3Title.tr(),
        description: OnboardingKeys.page3Desc.tr(),
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
      globalBackgroundColor: theme.scaffoldBackgroundColor,
      // BUILD PAGES DYNAMICALLY
      pages: onboardingList.map((item) {
        return PageViewModel(
          title: item.title,
          body: item.description,
          image: OnBoardingImage(imagePath: item.imageAssets, icon: item.icon , colorIcon: colors[random.nextInt(colors.length)],),
          decoration: PageDecoration(
            titleTextStyle: theme.textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ), //fontSize: 22.sp,
            bodyTextStyle: theme.textTheme.bodyLarge!, //fontSize: 16.sp,
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
      skip: Text(
        OnboardingKeys.btnSkip.tr(),
        style: theme.textTheme.bodyLarge!,
      ),

      next: OnBoardingButton(
        text: OnboardingKeys.btnNext.tr(),
        icon: Icons.arrow_forward,
      ),

      done: OnBoardingButton(
        text: OnboardingKeys.btnDone.tr(),
        isDone: true,
      ) ,
      onDone: () {
        GoRouter.of(context).go(AppRoutes.kAuth);
      },
    );
  }
}

