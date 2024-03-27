import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/utils/custom_search_text_field.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
