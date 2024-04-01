import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const Text(
            'Back',
            style: TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
