import 'package:flutter/material.dart';
import 'package:knowledge_world/core/utils/styles.dart';

class AppLogoText extends StatelessWidget {
  const AppLogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Text(
        'READ ',
        style: Styles.textStyle64,
      ),
      Text(
        'IT',
        style: Styles.textStyle64,
      ),
    ]);
  }
}
