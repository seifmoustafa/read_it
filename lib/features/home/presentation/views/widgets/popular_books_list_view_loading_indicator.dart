import 'package:flutter/material.dart';
import 'package:read_it/core/widgets/custom_fading_widget.dart';
import 'package:read_it/features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';

class PopularBooksListViewLoadingIndicator extends StatelessWidget {
  const PopularBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.26,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                child: CustomBookImageLoadingIndicator(),
              ),
            );
          }),
        ),
      ),
    );
  }
}
