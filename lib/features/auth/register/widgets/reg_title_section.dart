import 'package:flutter/material.dart';
import 'package:knowledge_world/core/utils/app_logo_text.dart';
import 'package:knowledge_world/core/utils/assets.dart';
import 'package:knowledge_world/core/utils/styles.dart';

class RegTitleSection extends StatelessWidget {
  const RegTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppLogoText(),
                Expanded(child: Image.asset(AssetsData.logo))
              ],
            ),
            const SizedBox(
              height: 66,
            ),
          ]),
    );
  }
}
