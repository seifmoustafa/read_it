import 'package:flutter/material.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/features/home/presentation/views/widgets/custom_book_item.dart';

class NewestBooksListViewItem extends StatelessWidget {
  const NewestBooksListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.withOpacity(.2)),
      height: 125,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBookImage(),
          SizedBox(
            width: 7,
          ),
          Padding(
            padding: EdgeInsets.only(top: 7.0),
            child: Text(
              'History Book',
              style: Styles.textStyle14,
            ),
          )
        ],
      ),
    );
  }
}
