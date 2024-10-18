import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/features/home/presentation/views/widgets/logo_section.dart';
import 'package:read_it/features/home/presentation/views/widgets/newest_section.dart';
import 'package:read_it/features/home/presentation/views/widgets/search_section.dart';
import 'package:read_it/features/home/presentation/views/widgets/popular_section.dart';
import 'package:read_it/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:read_it/features/home/presentation/views/widgets/custom_one_floating_button.dart';
import 'package:read_it/features/home/presentation/manage/newest_books_cubit/newest_books_cubit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    // Check if we've scrolled close to the bottom
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        await BlocProvider.of<NewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll); // Clean up listener
    _scrollController.dispose();
    super.dispose();
  }

  List<BookModel> booksList = [];
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController, // Attach the controller
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: LogoSection()),
                    SizedBox(height: 24),
                    SearchSection(),
                    SizedBox(height: 24),
                    PopularSection(),
                    SizedBox(height: 24),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: NewestSection(),
              ),
              BlocConsumer<NewestBooksCubit, NewestBooksState>(
                listener: (context, state) {
                  if (state is NewestBooksSuccess) {
                    setState(() {
                      booksList.addAll(state.books);
                    });
                  }
                  if (state is NewestBooksPaginationFaliure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.errMessage,
                          style: const TextStyle(color: Colors.white),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return NewestBooksListView(
                    state: state,
                    booksList: booksList,
                  );
                },
              ),
            ],
          ),
          CustomOneFloationgButtons(),
        ],
      ),
    );
  }
}
