import 'package:flutter/material.dart';
import 'package:knowledge_world/core/utils/assets.dart';

class FadingLogo extends StatelessWidget {
  const FadingLogo({
    super.key,
    required this.fadeAnimation,
  });

  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: fadeAnimation,
        builder: (context, _) {
          return FadeTransition(
            opacity: fadeAnimation,
            child: Image.asset(AssetsData.logo),
          );
        });
  }
}
