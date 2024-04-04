import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/core/functions/custom_snack_bar.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_title.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_app_bar.dart';
import 'package:read_it/features/profile/presentation/manage/profile_cubit/profile_cubit.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_profile_image.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_profile_text_field.dart';
import 'package:read_it/features/profile/presentation/manage/profile_edit_cubit/profile_edit_cubit.dart';
import 'package:read_it/features/profile/presentation/manage/profile_details_cubit/profile_details_cubit.dart';

class ProfileEditViewBody extends StatelessWidget {
  const ProfileEditViewBody({Key? key});

  @override
  Widget build(BuildContext context) {
    String? userName;
    String? phoneNumber;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(viewName: 'Edit Profile'),
              BlocProvider(
                create: (context) => ProfileCubit(),
                child: const Center(
                  child: CustomProfileImage(path: AppRouter.kProfileEditView),
                ),
              ),
              const SizedBox(height: 46),
              BlocBuilder<ProfileDetailsCubit, ProfileDetailsState>(
                builder: (context, state) {
                  if (state is ProfileDetailsInitial) {
                    BlocProvider.of<ProfileDetailsCubit>(context)
                        .fetchProfileDetails();
                    return const CircularProgressIndicator();
                  } else if (state is ProfileDetailSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTitle(title: 'User Name'),
                        CustomProfileTextField(
                          onSubmitted: (data) {
                            userName = data;
                          },
                          controller: TextEditingController(
                              text: '${state.firstName} ${state.lastName}'),
                          enable: true,
                        ),
                        const SizedBox(height: 16),
                        const CustomTitle(title: 'Phone Number'),
                        CustomProfileTextField(
                          onSubmitted: (data) {
                            phoneNumber = data;
                          },
                          enable: true,
                          controller:
                              TextEditingController(text: state.phoneNumber),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  } else {
                    return const Center(
                      child: Text(
                        'Error fetching profile details',
                        style: Styles.textStyle30,
                      ),
                    );
                  }
                },
              ),
              const CustomTitle(title: 'Password'),
              const CustomProfileTextField(
                enable: false,
                info: '***********',
                suffixIcon: Icons.edit,
              ),
              const SizedBox(height: 86),
              BlocConsumer<ProfileEditCubit, ProfileEditState>(
                listener: (context, state) {
                  if (state is ProfileEditSuccess) {
                    GoRouter.of(context).pushReplacement(
                      AppRouter.kProfileDetails,
                    );
                  } else if (state is ProfileEditFailure) {
                    customSnackBar(context, state.errMessage);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    buttonName: 'Submit',
                    isLoading: state is ProfileEditLoading,
                    onTap: () {
                      // Dispatch events to edit user name and phone number
                      BlocProvider.of<ProfileEditCubit>(context)
                          .editUserName(userName!);
                      BlocProvider.of<ProfileEditCubit>(context)
                          .editPhoneNumber(phoneNumber!);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
