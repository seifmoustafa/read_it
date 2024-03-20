import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/features/auth/widgets/custom_button.dart';
import 'package:read_it/features/auth/widgets/custom_form_text_field.dart';
import 'package:read_it/features/auth/widgets/custom_third_party_sign.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    GlobalKey<FormState> formkey = GlobalKey();

    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 37),
            child: Text(
              'SIGN IN TO YOUR ACCOUNT',
              style: Styles.textStyle20,
            ),
          ),
          const SizedBox(height: 47),
          CustomFormTextField(
            hintText: 'Email',
            onChanged: (data) {
              email = data;
            },
            obscureText: true,
          ),
          const SizedBox(height: 25),
          CustomFormTextField(
            hintText: 'Password',
            onChanged: (data) {
              password = data;
            },
            obscureText: true,
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.only(left: 220),
            child: Text(
              'forgot your password?',
              style: Styles.textStyle14,
            ),
          ),
          const SizedBox(height: 39),
          const CustomButton(buttonName: 'SIGN IN'),
          const SizedBox(
            height: 51,
          ),
          const CustomThirdPartySign(),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w100),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kRegisterView);
                },
                child: Text(
                  ' Create',
                  style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          const SizedBox(height: 89),
        ],
      ),
    );
  }
}
