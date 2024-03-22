import 'package:flutter/material.dart';
import 'package:read_it/constants.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    this.onChanged,
    super.key,
    this.hintText,
    this.obscureText = false,
    this.textInputType,
  });
  final String? hintText;

  final bool? obscureText;
  final Function(String)? onChanged;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: TextFormField(
        keyboardType: textInputType,
        obscureText: obscureText!,
        validator: (data) {
          if (data!.isEmpty) {
            return 'Field is required';
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: kTextFillColor,
          hintText: hintText,
          hintStyle: const TextStyle(color: kTextFormColor),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: kTextFillColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: kTextFillColor),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kTextFillColor),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
