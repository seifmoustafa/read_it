import 'package:flutter/material.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_app_bar.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            viewName: 'Favorites',
          ),
        ],
      ),
    );
  }
}
