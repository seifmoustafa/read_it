import 'package:flutter/material.dart';
import 'package:knowledge_world/constants.dart';
import 'package:knowledge_world/features/auth/login/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kTheme,
      child: const LoginViewBody(),
    );
  }
}
