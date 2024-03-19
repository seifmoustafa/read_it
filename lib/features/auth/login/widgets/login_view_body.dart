import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:knowledge_world/core/utils/styles.dart';
import 'package:knowledge_world/features/auth/login/widgets/custom_button.dart';
import 'package:knowledge_world/features/auth/login/widgets/custom_form_text_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TitleSection(),
        Expanded(
          // Wrap AuthSection with Expanded
          child: AuthSection(),
        ),
      ],
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 112),
        Padding(
          padding: EdgeInsets.only(left: 28),
          child: Text(
            'Knowledge \n World',
            style: Styles.textStyle50,
          ),
        ),
        SizedBox(height: 83),
        Padding(
          padding: EdgeInsets.only(left: 37),
          child: Text(
            'Hello',
            style: Styles.textStyle40,
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}

class AuthSection extends StatelessWidget {
  const AuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    GlobalKey<FormState> formkey = GlobalKey();

    return Form(
      key: formkey,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 37),
            child: Text(
              'SIGN IN TO YOUR ACCOUNT',
              style: Styles.textStyle20,
            ),
          ),
          const SizedBox(height: 47),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomFormTextField(
              hintText: 'Email',
              onChanged: (data) {
                email = data;
              },
              obscureText: true,
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomFormTextField(
              hintText: 'Password',
              onChanged: (data) {
                password = data;
              },
              obscureText: true,
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.only(right: 22.0),
            child: Text(
              'forgot your password?',
              style: Styles.textStyle10,
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(height: 39),
          const CustomButton(buttonName: 'SIGN IN'),
          const SizedBox(
            height: 51,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: Styles.textStyle10.copyWith(fontWeight: FontWeight.w100),
              ),
              Text(
                ' Create',
                style: Styles.textStyle10.copyWith(fontWeight: FontWeight.w800),
              )
            ],
          ),
          const SizedBox(height: 89),
        ],
      ),
    );
  }
}
