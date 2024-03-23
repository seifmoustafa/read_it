import 'package:flutter/material.dart';
import 'package:read_it/features/auth/presentation/views/reset_password/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResetPasswordViewBody(),
    );
  }
}
