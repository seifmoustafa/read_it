import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:read_it/core/functions/custom_snack_bar.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/features/auth/presentation/manage/register_cubit/register_cubit.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_form_text_field.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_password_form_text_field.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_third_party_sign.dart';

class RegisterInfoSection extends StatelessWidget {
  const RegisterInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    GlobalKey<FormState> formkey1 = GlobalKey();

    String? firstName;
    String? lastName;
    String? phoneNumber;
    String? email;
    String? password;
    bool isLoading = false;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterFailure) {
          customSnackBar(context, state.errMessage);
          isLoading = false;
        } else {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomFormTextField(
                  hintText: 'First Name',
                  onChanged: (data) {
                    firstName = data;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomFormTextField(
                  hintText: 'Last Name',
                  onChanged: (data) {
                    lastName = data;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomFormTextField(
                  textInputType: TextInputType.number,
                  hintText: 'Phone Number',
                  onChanged: (data) {
                    phoneNumber = data;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomFormTextField(
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomPasswordFormTextField(
                  hintText: 'Password',
                  key: formkey1,
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
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<RegisterCubit>(context).registerUser(
                          email: email!,
                          password: password!,
                          firstName: firstName!,
                          lastName: lastName!,
                          phoneNumber: phoneNumber!,
                        );
                      }
                    },
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
          ),
        );
      },
    );
  }
}
