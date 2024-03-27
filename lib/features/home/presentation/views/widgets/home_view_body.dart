import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/utils/assets.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/utils/custom_search_text_field.dart';
import 'package:read_it/features/home/presentation/views/widgets/logo_section.dart';
import 'package:read_it/features/home/presentation/views/widgets/search_section.dart';
import 'package:read_it/features/home/presentation/views/widgets/popular_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LogoSection(),
            SizedBox(
              height: 24,
            ),
            SearchSection(),
            SizedBox(
              height: 32,
            ),
            PopularSection(),
          ],
        ),
      ),
    ]);
  }
}
