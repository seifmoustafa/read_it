import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/features/home/presentation/views/widgets/logo_section.dart';
import 'package:read_it/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:read_it/features/home/presentation/views/widgets/custom_two_floating_buttons.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
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
        ),
        const CustomTwoFloationgButtons(),
      ],
    );
  }
}
