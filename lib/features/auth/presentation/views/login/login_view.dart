import 'package:flutter/material.dart';
import 'package:read_it/constants.dart';
import 'package:read_it/features/auth/presentation/views/login/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kTheme,
        child: const LoginViewBody(),
      ),
    );
  }
}
