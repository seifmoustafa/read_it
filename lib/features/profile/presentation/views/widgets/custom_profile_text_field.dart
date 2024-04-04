import 'package:flutter/material.dart';
import 'package:read_it/core/utils/styles.dart';

class CustomProfileTextField extends StatelessWidget {
  const CustomProfileTextField(
      {super.key,
      this.enable = false,
      required this.info,
      this.obscureText = false,
      this.suffixIcon,
      this.controller,
      this.onPressed});
  final bool enable;
  final String info;
  final bool obscureText;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        enabled: enable,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(suffixIcon),
              onPressed: onPressed,
            ),
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
