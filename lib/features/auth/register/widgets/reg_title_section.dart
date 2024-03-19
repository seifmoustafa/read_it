import 'package:flutter/material.dart';
import 'package:knowledge_world/core/utils/styles.dart';

class RegTitleSection extends StatelessWidget {
  const RegTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text(
            'Knowledge \n World',
            style: Styles.textStyle50,
          ),
          SizedBox(height: 24),
          Text(
            'SIGN UP',
            style: Styles.textStyle20,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
