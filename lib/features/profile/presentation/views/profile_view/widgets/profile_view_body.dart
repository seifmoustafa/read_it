import 'package:flutter/material.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/profile_app_bar.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/profile_actions.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/custom_profile_app_bar.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileAppBar(),
          // SizedBox(height: 8),
          CustomProfileInfo(),
          SizedBox(
            height: 24,
          ),
          ProfileActions(),
        ],
      ),
    );
  }
}
