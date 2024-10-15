import 'package:flutter/material.dart';
import 'package:read_it/constants.dart';

class CustomPasswordFormTextField extends StatefulWidget {
  const CustomPasswordFormTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.textInputType,
  });

  final String? hintText;

  final Function(String)? onChanged;
  final TextInputType? textInputType;

  @override
  State<CustomPasswordFormTextField> createState() =>
      _CustomPasswordFormTextFieldState();
}

class _CustomPasswordFormTextFieldState
    extends State<CustomPasswordFormTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: TextFormField(
        keyboardType: widget.textInputType,
        obscureText: obscureText,
        validator: (data) {
          if (data!.isEmpty) {
            return 'Field is required';
          }
          return null;
        },
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
          hintText: widget.hintText,
          filled: true,
          fillColor: kTextFillColor,
          hintStyle: const TextStyle(
            color: kTextFormColor,
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(16))),
        ),
      ),
    );
  }
}
