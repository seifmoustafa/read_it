import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/core/widgets/custom_error_widget.dart';
import 'package:read_it/core/widgets/custom_loading_indecator.dart';
import 'package:read_it/features/home/presentation/views/widgets/popular_list_view_item.dart';
import 'package:read_it/features/home/presentation/manage/popular_books_cubit/popular_books_cubit.dart';

class PopularListView extends StatefulWidget {
  const PopularListView({super.key});

  @override
  _PopularListViewState createState() => _PopularListViewState();
}

class _PopularListViewState extends State<PopularListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    // Attach the listener to the scroll controller
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition >= maxScrollLength * 0.7) {
      // Trigger the fetchPopularBooks() method when 70% of the list is scrolled
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<PopularBooksCubit>(context)
            .fetchPopularBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    // Dispose of the controller to prevent memory leaks
    _scrollController.dispose();
    super.dispose();
  }

  List<BookModel> booksList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularBooksCubit, PopularBooksState>(
      listener: (context, state) {
        if (state is PopularBooksSuccess) {
          booksList.addAll(state.books);
        }
        if (state is PopularBooksPaginationFaliure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errMessage,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is PopularBooksSuccess ||
            state is PopularBooksPaginationLoading ||
            state is PopularBooksPaginationFaliure) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.26,
            child: ListView.builder(
              controller: _scrollController, // Attach the scroll controller
              scrollDirection: Axis.horizontal,
              itemCount: booksList.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kBookDetailsView,
                              extra: booksList[index]);
                        },
                        child: PopularBookListViewItem(
                          book: booksList[index],
                        ),
                      )),
                );
              }),
            ),
          );
        } else if (state is PopularBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
