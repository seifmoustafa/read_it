import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/core/widgets/custom_error_widget.dart';
import 'package:read_it/core/widgets/books_list_view_item.dart';
import 'package:read_it/features/home/presentation/manage/newest_books_cubit/newest_books_cubit.dart';
import 'package:read_it/features/home/presentation/views/widgets/newest_books_list_view_loading_indicator.dart';

class NewestBooksListView extends StatelessWidget {
  final NewestBooksState state;
  final List<BookModel> booksList;

  const NewestBooksListView(
      {super.key, required this.state, required this.booksList});
  @override
  Widget build(BuildContext context) {
    if (state is NewestBooksSuccess ||
        state is NewestBooksPaginationLoading ||
        state is NewestBooksPaginationFaliure) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: 16.0,
                left: 16,
                right: MediaQuery.of(context).size.width * .2,
              ),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kBookDetailsView,
                      extra: booksList[index]);
                },
                child: BooksListViewItem(book: booksList[index]),
              ),
            );
          },
          childCount: booksList.length,
        ),
      );
    } else if (state is NewestBooksFailure) {
      return SliverToBoxAdapter(
        child: CustomErrorWidget(errorMessage: "Error"),
      );
    } else {
      return SliverToBoxAdapter(
        child: NewestBooksListViewLoadingIndicator(),
      );
    }
  }
}
