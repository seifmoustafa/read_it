import 'package:flutter/material.dart';
import 'package:read_it/core/utils/styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Text(
        title,
        style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w300, color: Colors.grey.withOpacity(.7)),
      ),
    );
  }
}
