import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:read_it/features/home/presentation/views/widgets/popular_books_list_view_loading_indicator.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          placeholder: (context, value) {
            return PopularBooksListViewLoadingIndicator();
          },
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
