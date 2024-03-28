import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/custom_error_widget.dart';
import 'package:read_it/core/utils/custom_loading_indecator.dart';
import 'package:read_it/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:read_it/features/home/presentation/manage/newest_books_cubit/newest_books_cubit.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: 16.0,
                    right: MediaQuery.of(context).size.width * .2),
                child: NewestBooksListViewItem(
                  book: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
