import 'package:flutter/material.dart';
import 'package:read_it/core/utils/styles.dart';

class NewestSection extends StatelessWidget {
  const NewestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Newest',
            style: Styles.textStyle16,
          ),
        ],
      ),
    );
  }
}
