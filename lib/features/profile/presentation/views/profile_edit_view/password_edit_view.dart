import 'package:flutter/material.dart';
import 'package:read_it/features/profile/presentation/views/profile_edit_view/widgets/password_edit_view_body.dart';

class PasswordEditView extends StatelessWidget {
  const PasswordEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PasswordEditViewBody(),
    );
  }
}
