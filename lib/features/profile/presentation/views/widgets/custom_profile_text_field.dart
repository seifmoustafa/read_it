import 'package:flutter/material.dart';
import 'package:read_it/core/utils/styles.dart';

class CustomProfileTextField extends StatelessWidget {
  const CustomProfileTextField(
      {super.key,
      this.enable = false,
      this.info,
      this.obscureText = false,
      this.suffixIcon,
      this.controller,
      this.onPressed,
      this.onChanged});
  final bool enable;
  final String? info;
  final bool obscureText;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final void Function()? onPressed;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText,
        enabled: enable,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: onPressed,
              child: Icon(
                suffixIcon,
              ),
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
