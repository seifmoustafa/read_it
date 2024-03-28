import 'package:flutter/material.dart';
import 'package:read_it/core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});
  // final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Image.asset(fit: BoxFit.fill, AssetsData.testImage),
      ),
    );
  }
}
