import 'package:flutter/material.dart';
import 'package:knowledge_world/features/auth/register/widgets/reg_title_section.dart';
import 'package:knowledge_world/features/auth/register/widgets/register_info_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RegTitleSection(),
            RegisterInfoSection(),
          ],
        ),
      ),
    );
  }
}
