import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/custom_container.dart';

class CustomFavoriteSection extends StatelessWidget {
  const CustomFavoriteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      action: 'Favorites',
      onTap: () {
        GoRouter.of(context).push(AppRouter.kFavoriteView);
      },
      firstIcon: Icons.favorite,
      secIcon: Icons.arrow_forward_ios_outlined,
    );
  }
}
