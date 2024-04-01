import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/widgets/custom_search_text_field.dart';
import 'package:read_it/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:read_it/features/search/presentation/manage/search_cubit/searched_book_cubit.dart';

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
    final TextEditingController textEditingController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(slivers: [
        SliverFillRemaining(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: CustomSearchTextField(
                  controller: textEditingController,
                  onChanged: (data) {
                    _searchBooks(context, data);
                  },
                  onSubmitted: (data) {
                    _searchBooks(context, data);
                  },
                  focusNode: _focusNode,
                  prefixOnPressed: () {
                    GoRouter.of(context).pop();
                    textEditingController.clear();
                  },
                  suffixOnPressed: () {
                    _searchBooks(context, textEditingController.text);
                    textEditingController.clear();
                  },
                  prefixIcon: Icons.close,
                  suffixIcon: Icons.search,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Search Results',
                style: Styles.textStyle18,
              ),
              const Expanded(child: SearchResultListView()),
            ],
          ),
        ),
      ]),
    );
  }

  void _searchBooks(BuildContext context, String data) {
    BlocProvider.of<SearchedBookCubit>(context)
        .fetchSearchedBooks(categoryName: data);
  }
}
