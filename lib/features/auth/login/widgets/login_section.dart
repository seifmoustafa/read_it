import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:knowledge_world/core/utils/app_router.dart';
import 'package:knowledge_world/core/utils/styles.dart';
import 'package:knowledge_world/features/auth/widgets/custom_button.dart';
import 'package:knowledge_world/features/auth/widgets/custom_form_text_field.dart';
import 'package:knowledge_world/features/auth/widgets/custom_sing_button.dart';

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
            padding: EdgeInsets.only(left: 264),
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
          const Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              'Or Sign with',
              style: Styles.textStyle16,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Row(
              children: [
                CustomSingButton(
                  icon: Icons.facebook,
                ),
              ],
            ),
          ),
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
          SizedBox(height: 89),
        ],
      ),
    );
  }
}
