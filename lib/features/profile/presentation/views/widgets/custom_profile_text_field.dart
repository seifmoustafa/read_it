import 'package:flutter/material.dart';
import 'package:read_it/core/utils/styles.dart';

class CustomProfileTextField extends StatelessWidget {
  const CustomProfileTextField(
      {super.key, this.enable = false, required this.info});
  final bool enable;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        enabled: enable,
        decoration: InputDecoration(
            hintText: info,
            hintStyle: Styles.textStyle18.copyWith(color: Colors.black),
            border: const UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey,
            ))),
      ),
    );
  }
}
