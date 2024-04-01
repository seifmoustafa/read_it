import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/widgets/custom_error_widget.dart';
import 'package:read_it/core/widgets/books_list_view_item.dart';
import 'package:read_it/core/widgets/custom_loading_indecator.dart';
import 'package:read_it/features/search/presentation/manage/search_cubit/searched_book_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBookCubit, SearchedBookState>(
      builder: (context, state) {
        if (state is SearchedBookSuccess) {
          return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.bookModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  // child: BookListViewItem(bookModel: ,),
                  child: GestureDetector(onTap: (){
                    GoRouter.of(context).pushReplacement(AppRouter.kBookDetailsView,extra: state.bookModel[index]);
                  },child: BooksListViewItem(book: state.bookModel[index])),
                );
              });
        } else if (state is SearchedBookFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
