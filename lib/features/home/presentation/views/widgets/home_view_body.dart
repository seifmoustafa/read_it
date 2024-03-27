import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/utils/assets.dart';
import 'package:read_it/core/utils/custom_search_text_field.dart';
import 'package:read_it/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Text(
          'Popular',
          style: Styles.textStyle16.copyWith(
            shadows: [
              const Shadow(
                offset: Offset(0, 7),
                color: Colors.black,
                blurRadius: 5,
              )
            ],
          ),
        )
      ],
    );
  }
}
