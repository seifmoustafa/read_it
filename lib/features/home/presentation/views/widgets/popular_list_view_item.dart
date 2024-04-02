import 'package:flutter/material.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/features/home/presentation/views/widgets/custom_book_image.dart';

class PopularBookListViewItem extends StatelessWidget {
  const PopularBookListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .2,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .16,
            child: CustomBookImage(
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 84,
            child: Center(
              child: Text(
                book.volumeInfo.title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          SizedBox(
            width: 84,
            child: Text(
              book.volumeInfo.authors?[0] ?? 'Unknown Author',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          )
        ],
      ),
    );

    // Column(
    //   children: [
    //     SizedBox(
    //         height: MediaQuery.of(context).size.height * .16,
    //         child: const CustomBookImage()),
    //     const SizedBox(
    //       height: 8,
    //     ),
    //     Text(
    //       truncatedText,
    //       maxLines: 1,
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //     const SizedBox(
    //       height: 8,
    //     ),
    //     Text(book.volumeInfo.authors?[0] ?? 'Unknown'),
    //   ],
    // );
  }
}
