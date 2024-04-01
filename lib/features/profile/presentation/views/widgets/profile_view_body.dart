import 'package:flutter/material.dart';
import 'package:read_it/features/profile/presentation/views/widgets/profile_actions.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_profile_app_bar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 36),
          CustomProfileAppBar(),
          SizedBox(
            height: 24,
          ),
          ProfileActions(),
        ],
      ),
    );
  }
}
