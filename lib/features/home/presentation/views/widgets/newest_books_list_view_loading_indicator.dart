import 'package:flutter/material.dart';
import 'package:read_it/core/widgets/custom_fading_widget.dart';
import 'package:read_it/features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';

class NewestBooksListViewLoadingIndicator extends StatelessWidget {
  const NewestBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: 16.0,
              left: 16,
              right: MediaQuery.of(context).size.width * .2,
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.withOpacity(.2)),
              height: 125,
              child: Row(
                children: [
                  CustomBookImageLoadingIndicator(),
                  SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
