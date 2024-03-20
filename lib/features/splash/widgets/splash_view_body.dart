import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/features/splash/widgets/fading_logo.dart';
import 'package:read_it/features/splash/widgets/slidingtext.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingBTAnimation;
  late Animation<Offset> slidingTBAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateToLogin();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FadingLogo(
          fadeAnimation: fadeAnimation,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlidingText(
              slidingAnimation: slidingBTAnimation,
              text: 'READ ',
            ),
            SlidingText(
              slidingAnimation: slidingTBAnimation,
              text: 'IT',
            ),
          ],
        )
      ],
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    slidingBTAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero).animate(
      animationController,
    );
    slidingTBAnimation =
        Tween<Offset>(begin: const Offset(0, -10), end: Offset.zero).animate(
      animationController,
    );
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      animationController,
    );
    animationController.forward();
  }

  void navigateToLogin() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
      },
    );
  }
}
