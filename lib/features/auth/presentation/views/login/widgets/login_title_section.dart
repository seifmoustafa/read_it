import 'package:flutter/material.dart';
import 'package:read_it/core/utils/app_logo_text.dart';
import 'package:read_it/core/utils/assets.dart';

class LoginTitleSection extends StatelessWidget {
  const LoginTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 28),
              child: AppLogoText(),
            ),
            Expanded(child: Image.asset(AssetsData.logo)),
          ],
        ),
        const SizedBox(
          height: 140,
        ),
      ],
    );
  }
}
