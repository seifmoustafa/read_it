import 'package:flutter/material.dart';
import 'package:read_it/core/utils/assets.dart';
import 'package:read_it/features/auth/presentation/views/reset_password/widgets/reset_section.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(child: Image.asset(AssetsData.logoLight)),
          const SizedBox(
            height: 89,
          ),
          const ResetSection(),
        ],
      ),
    );
  }
}
