import 'package:flutter/material.dart';
import 'package:read_it/features/profile/presentation/views/widgets/sign_out.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_container.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SignOut(),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: CustomContainer(
            firstIcon: Icons.settings,
            action: 'Settings',
          ),
        ),
      ],
    );
  }
}
