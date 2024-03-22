import 'package:flutter/material.dart';
import 'package:read_it/core/utils/assets.dart';

class RegTitleSection extends StatelessWidget {
  const RegTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetsData.logoLight),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
          ]),
    );
  }
}
