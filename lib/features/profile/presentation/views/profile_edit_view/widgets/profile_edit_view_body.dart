import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_title.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_app_bar.dart';
import 'package:read_it/features/profile/presentation/manage/profile_cubit/profile_cubit.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_profile_image.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_profile_text_field.dart';
import 'package:read_it/features/profile/presentation/manage/profile_details_cubit/profile_details_cubit.dart';

class ProfileEditViewBody extends StatelessWidget {
  const ProfileEditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(viewName: 'Edit Profile'),
              BlocProvider(
                create: (context) => ProfileCubit(),
                child: const Center(
                    child:
                        CustomProfileImage(path: AppRouter.kProfileEditView)),
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
                        const CustomTitle(title: 'First Name'),
                        CustomProfileTextField(
                          enable: true,
                          info: state.firstName,
                        ),
                        const SizedBox(height: 16),
                        const CustomTitle(title: 'Last Name'),
                        CustomProfileTextField(
                          enable: true,
                          info: state.lastName,
                        ),
                        const SizedBox(height: 16),
                        const CustomTitle(title: 'Phone Number'),
                        CustomProfileTextField(
                          enable: true,
                          info: state.phoneNumber,
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
              const SizedBox(
                height: 86,
              ),
              CustomButton(
                buttonName: 'Submit',
                isLoading: false,
                onTap: () {
                  GoRouter.of(context).pushReplacement(
                    AppRouter.kProfileDetails,
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
