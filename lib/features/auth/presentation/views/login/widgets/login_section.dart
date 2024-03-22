import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:read_it/core/functions/custom_snack_bar.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/features/auth/presentation/manage/login_cubit/login_cubit.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_form_text_field.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_password_form_text_field.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_third_party_sign.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    GlobalKey<FormState> formkey = GlobalKey();

    bool isLoading = false;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginFailure) {
          isLoading = false;
          customSnackBar(context, state.errMessage);
        } else if (state is LoginSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: false,
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                ),
                const SizedBox(height: 25),
                CustomPasswordFormTextField(
                  hintText: 'Password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 220),
                  child: Text(
                    'forgot your password?',
                    style: Styles.textStyle14
                        .copyWith(color: const Color(0xff818B89)),
                  ),
                ),
                const SizedBox(height: 39),
                CustomButton(
                  isLoading: isLoading,
                  buttonName: 'SIGN IN',
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context)
                          .signInWithEmailAndPassword(
                              email: email!, password: password!);
                    }
                  },
                ),
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
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w100),
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kRegisterView);
                      },
                      child: Text(
                        ' Create',
                        style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 89),
              ],
            ),
          ),
        );
      },
    );
  }
}
