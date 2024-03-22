import 'package:flutter/material.dart';
import 'package:read_it/core/utils/assets.dart';

class LoginTitleSection extends StatelessWidget {
  const LoginTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 86,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Padding(
            //   padding: EdgeInsets.only(left: 28),
            //   child: AppLogoText(),
            // ),
            Image.asset(AssetsData.logoLight),
          ],
        ),
        const SizedBox(
          height: 140,
        ),
      ],
    );
  }
}
