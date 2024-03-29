import 'package:flutter/material.dart';
import 'package:read_it/core/utils/styles.dart';

class AppLogoText extends StatelessWidget {
  const AppLogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(children: [
      Text(
        'READ IT',
        style: Styles.textStyle64,
      ),
    ]);
  }
}
