import 'package:flutter/material.dart';
import 'package:knowledge_world/constants.dart';
import 'package:knowledge_world/features/auth/register/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kTheme,
        child: const RegisterViewBody(),
      ),
    );
  }
}