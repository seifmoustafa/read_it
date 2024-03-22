import 'package:flutter/material.dart';
import 'package:read_it/features/auth/presentation/views/login/widgets/login_section.dart';
import 'package:read_it/features/auth/presentation/views/login/widgets/login_title_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginTitleSection(),
            LoginSection(),
          ],
        ),
      ),
    );
  }
}
