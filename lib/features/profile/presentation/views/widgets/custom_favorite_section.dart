import 'package:flutter/material.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_container.dart';

class CustomFavoriteSection extends StatelessWidget {
  const CustomFavoriteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      action: 'Favorites',
      onTap: () {},
      firstIcon: Icons.favorite,
      secIcon: Icons.arrow_forward_ios_outlined,
    );
  }
}
