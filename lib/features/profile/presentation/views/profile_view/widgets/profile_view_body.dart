import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/features/profile/presentation/manage/profile_cubit/profile_cubit.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_profile_image.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/custom_username.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/profile_app_bar.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/profile_actions.dart';

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
          CustomProfileImage(
            path: AppRouter.kProfileView,
          ),
          SizedBox(
            height: 8,
          ),
          CustomUserName(),
          SizedBox(
            height: 24,
          ),
          ProfileActions(),
        ],
      ),
    );
  }
}
