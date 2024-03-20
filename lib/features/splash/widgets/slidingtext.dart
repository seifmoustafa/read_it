import 'package:flutter/material.dart';
import 'package:knowledge_world/core/utils/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
    required this.text,
  });

  final Animation<Offset> slidingAnimation;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              text,
              style: Styles.textStyle64,
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
