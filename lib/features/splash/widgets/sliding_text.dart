import 'package:flutter/material.dart';
import 'package:knowledge_world/core/utils/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              'Knowledge World',
              style: Styles.textStyle50,
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
