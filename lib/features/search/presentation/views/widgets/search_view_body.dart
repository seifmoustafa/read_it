import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/utils/custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(
            child: CustomSearchTextField(
              prefixOnPressed: () {
                GoRouter.of(context).pop();
              },
              prefixIcon: Icons.close,
              suffixIcon: Icons.search,
            ),
          ),
        ],
      ),
    );
  }
}
