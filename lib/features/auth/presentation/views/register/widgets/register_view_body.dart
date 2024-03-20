import 'package:flutter/material.dart';
import 'package:read_it/features/auth/presentation/views/register/widgets/reg_title_section.dart';
import 'package:read_it/features/auth/presentation/views/register/widgets/register_info_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const RegTitleSection(),
            RegisterInfoSection(),
          ],
        ),
      ),
    );
  }
}
