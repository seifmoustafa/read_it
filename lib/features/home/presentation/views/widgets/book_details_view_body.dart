import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/features/home/presentation/views/widgets/logo_section.dart';
import 'package:read_it/features/home/presentation/views/widgets/custom_book_image.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: IconButton(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                  ),
                  const LogoSection(),
                ],
              ),
              const SizedBox(
                height: 62,
              ),
              BookDetailsSection(
                book: bookModel,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
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
                    imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '')),
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
            book.volumeInfo.description ?? 'No descreption',
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
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  size: 36,
                  color: Colors.red,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kWebView,
                      extra: book.volumeInfo.previewLink);
                },
                icon: const Icon(
                  Icons.download,
                  size: 46,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
