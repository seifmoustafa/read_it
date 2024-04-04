import 'package:flutter/material.dart';

class ProfileEditViewBody extends StatelessWidget {
  const ProfileEditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Column(),
        )
      ],
    );
  }
}
