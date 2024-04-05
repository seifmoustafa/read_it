import 'package:flutter/material.dart';
import 'package:read_it/core/widgets/custom_app_bar.dart';
import 'package:read_it/features/auth/presentation/views/register/widgets/reg_title_section.dart';
import 'package:read_it/features/auth/presentation/views/register/widgets/register_info_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(viewName: 'Register'),
            RegTitleSection(),
            RegisterInfoSection(),
          ],
        ),
      ),
    );
  }
}
