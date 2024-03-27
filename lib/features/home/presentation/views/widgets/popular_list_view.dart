import 'package:flutter/material.dart';
import 'package:read_it/features/home/presentation/views/widgets/popular_list_view_item.dart';

class PopularListView extends StatelessWidget {
  const PopularListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  child: const BookListViewItem()),
            );
          })),
    );
  }
}
