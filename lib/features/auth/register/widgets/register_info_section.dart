import 'package:flutter/material.dart';
import 'package:knowledge_world/features/auth/widgets/custom_button.dart';
import 'package:knowledge_world/features/auth/widgets/custom_form_text_field.dart';
import 'package:knowledge_world/features/auth/widgets/custom_third_party_sign.dart';

class RegisterInfoSection extends StatelessWidget {
  const RegisterInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    String? firstName;
    String? lastName;
    String? phoneNumber;
    String? email;
    String? password;

    GlobalKey<FormState> formkey = GlobalKey();

    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
            hintText: 'Phone Number',
            onChanged: (data) {
              phoneNumber = data;
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
            height: 50,
          ),
          Center(
            child: CustomButton(
              buttonName: 'SIGN UP',
              onTap: () {},
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          const CustomThirdPartySign(),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
