import 'package:flutter/material.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/features/home/presentation/views/widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(
        bookModel: bookModel,
      ),
    );
  }
}
