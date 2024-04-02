import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/core/functions/launch_custom_url.dart';
import 'package:read_it/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:read_it/features/home/presentation/manage/book_details_cubit/book_details_cubit.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection(
      {super.key, required this.book, required this.isFavorite});

  final BookModel book;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .2,
            ),
            child: Center(
              child: CustomBookImage(
                imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 19,
        ),
        Text(
          textAlign: TextAlign.center,
          book.volumeInfo.title!,
          style: Styles.textStyle20.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        Opacity(
          opacity: .5,
          child: Text(
            book.volumeInfo.authors?[0] ?? 'Unknown',
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            book.volumeInfo.description ?? 'No description',
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                if (isFavorite) {
                  BlocProvider.of<BookdetailsCubit>(context)
                      .deleteFromFavorites(book.id!);
                } else {
                  BlocProvider.of<BookdetailsCubit>(context)
                      .addToFavorites(book);
                }
              },
              icon: Icon(
                Icons.favorite,
                size: 36,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {
                  launchCustomUrl(context, book.volumeInfo.previewLink);
                },
                icon: const Icon(
                  Icons.download,
                  size: 46,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
