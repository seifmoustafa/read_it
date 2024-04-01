import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/book_model/book_model.dart';
import 'package:read_it/core/functions/custom_snack_bar.dart';
import 'package:read_it/core/widgets/books_list_view_item.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:read_it/features/profile/presentation/manage/profile_cubit/profile_cubit.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_profile_app_bar.dart';

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
          BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is SignOutSuccess) {
                isLoading = false;
                GoRouter.of(context).go(AppRouter.kLoginView);
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
                  BlocProvider.of<ProfileCubit>(context).signOut();
                },
                isLoading: isLoading,
              ));
            },
          ),
          FavoriteSection(),
        ],
      ),
    );
  }
}

class FavoriteSection extends StatelessWidget {
  const FavoriteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 17.0),
          child: Text(
            'Favorite',
            style: TextStyle(fontSize: 25),
          ),
        ),
        SizedBox(
          height: 36,
        ),
      ],
    );
  }
}
