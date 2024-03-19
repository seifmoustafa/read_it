import 'package:flutter/material.dart';
import 'package:knowledge_world/core/utils/styles.dart';

class LoginTitleSection extends StatelessWidget {
  const LoginTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        Padding(
          padding: EdgeInsets.only(left: 28),
          child: Text(
            'Knowledge \n World',
            style: Styles.textStyle50,
          ),
        ),
        SizedBox(height: 36),
        Padding(
          padding: EdgeInsets.only(left: 37),
          child: Text(
            'Hello',
            style: Styles.textStyle40,
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
