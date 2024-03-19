import 'package:flutter/material.dart';
import 'package:knowledge_world/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.buttonName});
  final void Function()? onTap;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 119.0,
          right: 156,
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ]),
          height: 45,
          child: Center(
            child: Text(
              buttonName,
              style: Styles.textStyle16,
            ),
          ),
        ),
      ),
    );
  }
}
