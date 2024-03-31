import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/features/profile/presentation/manage/profile_image_cubit/profile_image_cubit.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const Text(
            'Back',
            style: TextStyle(fontSize: 17),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 27.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocListener<ProfileImageCubit, ProfileImageState>(
                  listener: (context, state) {
                    if (state is ProfileImageUploaded) {
                      // If an image is uploaded, rebuild the profile view
                      BlocProvider.of<ProfileImageCubit>(context).reset();
                    }
                  },
                  child: BlocBuilder<ProfileImageCubit, ProfileImageState>(
                    builder: (context, state) {
                      if (state is ProfileImageLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is ProfileImagePicked) {
                        return GestureDetector(
                          onTap: () async {
                            final imageCubit =
                                context.read<ProfileImageCubit>();
                            await imageCubit.pickImage();
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.kProfileView);
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                              image: DecorationImage(
                                image: NetworkImage(
                                  state.imageFile.path,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () async {
                            final imageCubit =
                                context.read<ProfileImageCubit>();
                            await imageCubit.pickImage();
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.kProfileView);
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: const Icon(
                              color: Colors.white,
                              Icons.add,
                              size: 46,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                FutureBuilder<String>(
                  future: context.read<ProfileImageCubit>().fetchUserName(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text(
                        snapshot.data ?? '', // Display user name
                        style: Styles.textStyle14,
                      );
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
