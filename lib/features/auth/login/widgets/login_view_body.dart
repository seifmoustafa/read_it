import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:knowledge_world/features/auth/login/widgets/login_section.dart';
import 'package:knowledge_world/features/auth/login/widgets/login_title_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoginTitleSection(),
        LoginSection(),
      ],
    ));
  }
}
