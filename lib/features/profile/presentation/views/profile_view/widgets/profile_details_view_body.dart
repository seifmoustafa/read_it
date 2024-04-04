import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_app_bar.dart';
import 'package:read_it/features/profile/presentation/manage/profile_cubit/profile_cubit.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/custom_title.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/custom_profile_image.dart';
import 'package:read_it/features/profile/presentation/manage/profile_details_cubit/profile_details_cubit.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/custom_profile_text_field.dart';

class ProfileDetailsViewBody extends StatelessWidget {
  const ProfileDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(viewName: 'Profile Details'),
            BlocProvider(
              create: (context) => ProfileCubit(),
              child: const Center(
                  child: CustomProfileImage(path: AppRouter.kProfileDetails)),
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
                        enable: false,
                        info: state.firstName,
                      ),
                      const SizedBox(height: 16),
                      const CustomTitle(title: 'Last Name'),
                      CustomProfileTextField(
                        enable: false,
                        info: state.lastName,
                      ),
                      const SizedBox(height: 16),
                      const CustomTitle(title: 'Phone Number'),
                      CustomProfileTextField(
                        enable: false,
                        info: state.phoneNumber,
                      ),
                    ],
                  );
                } else {
                  return const Center(
                      child: Text(
                    'Error fetching profile details',
                    style: Styles.textStyle30,
                  ));
                }
              },
            ),
            Expanded(child: SizedBox()),
            CustomButton(buttonName: 'Edit', isLoading: false),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    ]);
  }
}
