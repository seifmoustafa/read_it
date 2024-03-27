import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/utils/assets.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/utils/custom_search_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 32,
          ),
          child: Center(
            child: SafeArea(
              child: Image.asset(AssetsData.logoLight),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Stack(children: [
            const CustomSearchTextField(
              prefixIcon: Icons.search,
              readOnly: true,
            ),
            SizedBox(
              height: 50,
              child: GestureDetector(onTap: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              }),
            )
          ]),
        ),
        const SizedBox(
          height: 32,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Text(
            'Popular',
            style: Styles.textStyle16,
          ),
        )
      ],
    );
  }
}
