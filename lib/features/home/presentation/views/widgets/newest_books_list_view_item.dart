import 'package:flutter/material.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/features/home/presentation/views/widgets/custom_book_image.dart';

class NewestBooksListViewItem extends StatelessWidget {
  const NewestBooksListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.withOpacity(.2)),
      height: 125,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
          const SizedBox(
            width: 7,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 7.0),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  book.volumeInfo.title!,
                  style: Styles.textStyle14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  book.volumeInfo.authors?[0] ?? 'Unkown Auther',
                  style: Styles.textStyle14,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              const Icon(
                Icons.download,
              )
            ],
          ))
        ],
      ),
    );
  }
}
