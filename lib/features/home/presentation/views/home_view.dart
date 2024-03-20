import 'package:flutter/material.dart';
import 'package:read_it/constants.dart';
import 'package:read_it/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kTheme,
        child: const HomeViewBody(),
      ),
    );
    ;
  }
}
