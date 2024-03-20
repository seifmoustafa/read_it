import 'package:flutter/material.dart';
import 'package:read_it/constants.dart';
import 'package:read_it/features/splash/presentation/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kTheme,
        child: const SplashViewBody(),
      ),
    );
  }
}
