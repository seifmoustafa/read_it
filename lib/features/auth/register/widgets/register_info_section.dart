import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knowledge_world/core/utils/styles.dart';
import 'package:knowledge_world/features/auth/widgets/custom_sing_button.dart';
import 'package:knowledge_world/features/auth/widgets/custom_button.dart';
import 'package:knowledge_world/features/auth/widgets/custom_form_text_field.dart';

class RegisterInfoSection extends StatelessWidget {
  const RegisterInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    String? firstName;
    String? lastName;
    String? email;
    String? password;

    GlobalKey<FormState> formkey = GlobalKey();

    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomFormTextField(
            obscureText: true,
            hintText: 'First Name',
            onChanged: (data) {
              firstName = data;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomFormTextField(
            obscureText: true,
            hintText: 'Last Name',
            onChanged: (data) {
              lastName = data;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomFormTextField(
            obscureText: true,
            hintText: 'Email',
            onChanged: (data) {
              email = data;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          CustomFormTextField(
            obscureText: true,
            hintText: 'Password',
            onChanged: (data) {
              password = data;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {},
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 24.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'SIGN UP with phone number?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )),
          const SizedBox(
            height: 24,
          ),
          Center(
            child: CustomButton(
              buttonName: 'SIGN UP',
              onTap: () {},
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          GestureDetector(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.only(right: 36.0),
                child: Text(
                  'Already have an account?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ))),
          const SizedBox(
            height: 45,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              'Or Sign with',
              style: Styles.textStyle16,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CustomSingButton(
                  icon: Icons.facebook,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
