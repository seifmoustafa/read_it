import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/features/profile/presentation/manage/profile_cubit/profile_cubit.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/custom_profile_image_container.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is ProfileImageUploaded) {
                BlocProvider.of<ProfileCubit>(context).reset();
              }
            },
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return CustomProfileImageContainer(
                  onTap: () async {
                    final imageCubit = context.read<ProfileCubit>();
                    await imageCubit.pickImage();
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.kProfileView);
                  },
                  imageUrl: state is ProfileImagePicked
                      ? state.imageFile?.path
                      : null,
                );
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FutureBuilder<String>(
            future: context.read<ProfileCubit>().fetchUserName(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text(
                  snapshot.data ?? '',
                  style: Styles.textStyle14,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
