import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/custom_container.dart';

class ProfileDetailsSection extends StatelessWidget {
  const ProfileDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomContainer(onTap: () {
      GoRouter.of(context).push(AppRouter.kProfileDetails);
    },
      action: 'Profile Details',
      firstIcon: FontAwesomeIcons.info,
      secIcon: Icons.arrow_forward_ios_outlined,
    );
  }
}
