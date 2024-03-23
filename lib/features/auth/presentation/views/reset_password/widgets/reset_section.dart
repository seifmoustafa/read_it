import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:read_it/core/functions/custom_snack_bar.dart';
import 'package:read_it/features/auth/presentation/manage/reset_password_cubit/reset_password_cubit.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_form_text_field.dart';

class ResetSection extends StatelessWidget {
  const ResetSection({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String? email;
    bool isLoading = false;
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          isLoading = false;
          customSnackBar(context, 'Reset message sent to your email');
          GoRouter.of(context).pop();
        } else if (state is ResetPasswordFailure) {
          isLoading = false;
          customSnackBar(context, state.errMessage);
        } else {
          isLoading = true;
        }
      },
      builder: (context, state) {
        return Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: CustomFormTextField(
                    textInputType: TextInputType.emailAddress,
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                CustomButton(
                  buttonName: 'Reset',
                  isLoading: isLoading,
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<ResetPasswordCubit>(context)
                          .resetPassword(email!);
                    }
                  },
                )
              ],
            ));
      },
    );
  }
}
