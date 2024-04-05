import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/widgets/custom_app_bar.dart';
import 'package:read_it/core/functions/custom_snack_bar.dart';
import 'package:read_it/core/widgets/custom_password_form_text_field.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_title.dart';
import 'package:read_it/features/profile/presentation/manage/profile_edit_cubit/profile_edit_cubit.dart';

class PasswordEditViewBody extends StatelessWidget {
  const PasswordEditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String? oldPassword;
    String? newPassword;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(viewName: 'Change Password'),
          const SizedBox(
            height: 64,
          ),
          const CustomTitle(title: 'Old Password'),
          const SizedBox(
            height: 16,
          ),
          CustomPasswordFormTextField(
            onChanged: (data) {
              oldPassword = data;
            },
            hintText: 'Enter old password',
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomTitle(title: 'New Password'),
          const SizedBox(
            height: 16,
          ),
          CustomPasswordFormTextField(
            hintText: 'Enter new password',
            onChanged: (data) {
              newPassword = data;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 220),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .pushReplacement(AppRouter.kResetPasswordView);
              },
              child: Text(
                'forgot your password?',
                style:
                    Styles.textStyle14.copyWith(color: const Color(0xff818B89)),
              ),
            ),
          ),
          const SizedBox(
            height: 120,
          ),
          BlocConsumer<ProfileEditCubit, ProfileEditState>(
            listener: (context, state) {
              if (state is ProfileEditSuccess) {
                GoRouter.of(context).pop();
              } else if (state is ProfileEditFailure) {
                customSnackBar(context, state.errMessage);
              }
            },
            builder: (context, state) {
              return CustomButton(
                buttonName: 'Submit',
                isLoading: state is ProfileEditLoading,
                onTap: () {
                  BlocProvider.of<ProfileEditCubit>(context)
                      .changePassword(oldPassword!, newPassword!);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
