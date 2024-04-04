import 'package:flutter/material.dart';
import 'package:read_it/core/utils/styles.dart';

class CustomPasswordEditContainer extends StatelessWidget {
  const CustomPasswordEditContainer({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        decoration: const UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.grey)),
        child: Row(
          children: [
            Text(
              '************',
              style: Styles.textStyle16.copyWith(
                color: Colors.black.withOpacity(.7),
              ),
            ),
            const Spacer(),
            IconButton(onPressed: onPressed, icon: const Icon(Icons.edit))
          ],
        ),
      ),
    );
  }
}
