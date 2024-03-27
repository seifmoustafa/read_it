import 'package:flutter/material.dart';
import 'package:read_it/core/utils/assets.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 32,
      ),
      child: Center(
        child: SafeArea(
          child: Image.asset(AssetsData.logoLight),
        ),
      ),
    );
  }
}
