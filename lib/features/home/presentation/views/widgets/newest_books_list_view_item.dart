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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBookImage(),
          SizedBox(
            width: 7,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 7.0),
                child: Text(
                  'History Book',
                  style: Styles.textStyle14,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 9.0),
                child: Text(
                  'Writer',
                  style: Styles.textStyle14,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 3, right: 16),
                  child: Text(
                    '8.9',
                    style: Styles.textStyle14,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.download,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3.0),
                    child: Text('8000'),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
