import 'package:flutter/material.dart';

class CustomProfileImageContainer extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback onTap;

  const CustomProfileImageContainer({
    super.key,
    required this.onTap,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
          image: imageUrl != null
              ? DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: imageUrl == null
            ? const Icon(
                color: Colors.white,
                Icons.add,
                size: 46,
              )
            : null,
      ),
    );
  }
}
