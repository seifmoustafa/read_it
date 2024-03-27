import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/utils/custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  _SearchViewBodyState createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    // Request focus when the widget is first built
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SafeArea(
            child: CustomSearchTextField(
              focusNode: _focusNode,
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
