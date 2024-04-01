import 'package:flutter/material.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/custom_sign_out.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/custom_favorite_section.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 16,
        ),
        CustomFavoriteSection(),
        SizedBox(
          height: 16,
        ),
        CustomSignOut(),
      ],
    );
  }
}
