import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/core/utils/app_router.dart';
import 'package:read_it/features/profile/presentation/manage/profile_cubit/profile_cubit.dart';

class CustomProfileInfo extends StatelessWidget {
  const CustomProfileInfo({super.key});

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
                if (state is ProfileImageLoading) {
                  return const CircularProgressIndicator();
                } else if (state is ProfileImagePicked) {
                  if (state.imageFile != null) {
                    return GestureDetector(
                      onTap: () async {
                        final imageCubit = context.read<ProfileCubit>();
                        await imageCubit.pickImage();
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.kProfileView);
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: DecorationImage(
                            image: NetworkImage(
                              state.imageFile!.path,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  } else {
                    // Render default placeholder icon if imageFile is null
                    return GestureDetector(
                      onTap: () async {
                        final imageCubit = context.read<ProfileCubit>();
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
                } else {
                  return GestureDetector(
                    onTap: () async {
                      final imageCubit = context.read<ProfileCubit>();
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