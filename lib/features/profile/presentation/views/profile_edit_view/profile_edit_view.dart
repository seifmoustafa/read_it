import 'package:flutter/material.dart';
import 'package:read_it/features/profile/presentation/views/profile_edit_view/widgets/profile_edit_view_body.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileEditViewBody(),
    );
  }
}
