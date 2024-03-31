import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/functions/custom_snack_bar.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:read_it/features/profile/presentation/manage/profile_image_cubit/profile_image_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 36),
          const CustomProfileAppBar(),
          const SizedBox(
            height: 24,
          ),
          BlocConsumer<ProfileImageCubit, ProfileImageState>(
            listener: (context, state) {
              if (state is SignOutSuccess) {
                isLoading = false;
              } else if (state is SignOutFailure) {
                isLoading = false;
                customSnackBar(context, state.errMessage);
              } else if (state is SignOutLoading) {
                isLoading = true;
              }
            },
            builder: (context, state) {
              return Center(
                  child: CustomButton(
                buttonName: 'Sign Out',
                onTap: () {
                  BlocProvider.of<ProfileImageCubit>(context).signOut(context);
                },
                isLoading: isLoading,
              ));
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 17.0),
            child: Text(
              'Favorite',
              style: TextStyle(fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
