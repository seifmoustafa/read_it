import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:read_it/features/profile/presentation/manage/profile_cubit/profile_cubit.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..checkFavoriteStatus(bookModel.id!),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          bool isFavorite = false;
          if (state is FavouriteItem) {
            isFavorite = state.bookId == bookModel.id;
          }
          return Scaffold(
            body: BookDetailsViewBody(
              bookModel: bookModel,
            ),
          );
        },
      ),
    );
  }
}
