import 'package:flutter/material.dart';
import 'package:read_it/features/home/presentation/views/widgets/logo_section.dart';
import 'package:read_it/features/home/presentation/views/widgets/newest_section.dart';
import 'package:read_it/features/home/presentation/views/widgets/search_section.dart';
import 'package:read_it/features/home/presentation/views/widgets/popular_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(child: LogoSection()),
              SizedBox(
                height: 24,
              ),
              SearchSection(),
              SizedBox(
                height: 24,
              ),
              PopularSection(),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: NewestSection(),
        )
      ]),
    );
  }
}
