import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:read_it/features/auth/login/widgets/login_section.dart';
import 'package:read_it/features/auth/login/widgets/login_title_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginTitleSection(),
          LoginSection(),
        ],
      )),
    );
  }
}
