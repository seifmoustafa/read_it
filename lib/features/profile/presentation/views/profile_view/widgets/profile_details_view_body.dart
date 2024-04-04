import 'package:flutter/material.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_app_bar.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/custom_profile_image.dart';

class ProfileDetailsViewBody extends StatelessWidget {
  const ProfileDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
      children: [
        CustomAppBar(viewName: 'Profile Details'),
        CustomProfileImage(
          path: AppRouter.kProfileDetails,
        )
      ],
    ));
  }
}
