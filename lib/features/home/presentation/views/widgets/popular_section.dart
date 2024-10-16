import 'package:flutter/material.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/features/home/presentation/views/widgets/popular_list_view.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Text(
            'Popular',
            style: Styles.textStyle16,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        PopularListView()
      ],
    );
  }
}
