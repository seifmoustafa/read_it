import 'package:flutter/material.dart';
import 'package:knowledge_world/constants.dart';
import 'package:knowledge_world/features/splash/widgets/splash_view_body.dart';

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
