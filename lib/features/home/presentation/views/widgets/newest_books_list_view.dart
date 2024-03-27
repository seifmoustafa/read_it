import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:read_it/features/home/presentation/views/widgets/newest_books_list_view_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: 16.0, right: MediaQuery.of(context).size.width * .2),
          child: const NewestBooksListViewItem(),
        );
      },
    );
  }
}
