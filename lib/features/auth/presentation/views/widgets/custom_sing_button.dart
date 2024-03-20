import 'package:flutter/material.dart';

class CustomSingButton extends StatelessWidget {
  const CustomSingButton({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
    );
  }
}
