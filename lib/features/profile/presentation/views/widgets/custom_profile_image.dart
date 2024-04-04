import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/widgets/custom_error_widget.dart';
import 'package:read_it/core/widgets/custom_loading_indecator.dart';
import 'package:read_it/features/profile/presentation/manage/profile_cubit/profile_cubit.dart';
import 'package:read_it/features/profile/presentation/views/profile_view/widgets/custom_profile_image_container.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key, required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileImageFailure) {
                return CustomErrorWidget(errorMessage: state.errMessage);
              }
              if (state is ProfileImagePicked) {
                return CustomProfileImageContainer(
                    onTap: () async {
                      final imageCubit = context.read<ProfileCubit>();
                      await imageCubit.pickImage();
                      GoRouter.of(context).pushReplacement(path);
                    },
                    imageUrl: state.imageFile!.path);
              } else if (state is ProfileImageLoading) {
                return const CustomLoadingIndecator();
              } else {
                return CustomProfileImageContainer(
                  onTap: () async {
                    final imageCubit = context.read<ProfileCubit>();
                    await imageCubit.pickImage();
                    GoRouter.of(context).pushReplacement(path);
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
