import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/functions/custom_snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_container.dart';
import 'package:read_it/features/profile/presentation/manage/profile_cubit/profile_cubit.dart';

class CustomSignOut extends StatelessWidget {
  const CustomSignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          isLoading = false;
          GoRouter.of(context).go(AppRouter.kLoginView);
        } else if (state is SignOutFailure) {
          isLoading = false;
          customSnackBar(context, state.errMessage);
        } else if (state is SignOutLoading) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: CustomContainer(
            onTap: () {
              BlocProvider.of<ProfileCubit>(context).signOut();
            },
            firstIcon: Icons.logout,
            action: 'Sign Out',
            actionColor: Colors.red,
          ),
        );
      },
    );
  }
}
