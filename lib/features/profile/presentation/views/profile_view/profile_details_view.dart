import 'package:flutter/material.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/profile_details_view_body.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileDetailsViewBody(),
    );
  }
}
