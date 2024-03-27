import 'package:flutter/material.dart';
import 'package:read_it/features/home/presentation/views/widgets/custom_book_item.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * .16,
            child: const CustomBookImage()),
        const SizedBox(
          height: 16,
        ),
        const Text('Name'),
        const SizedBox(
          height: 7,
        ),
        const Text('Writer'),
      ],
    );
  }
}
