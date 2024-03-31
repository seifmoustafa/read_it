import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/features/profile/presentation/manage/profile_image_cubit/profile_image_cubit.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({Key? key}) : super(key: key);

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
                BlocBuilder<ProfileImageCubit, ProfileImageState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () async {
                        final imageCubit = context.read<ProfileImageCubit>();
                        await imageCubit.pickImage();
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: state is ProfileImagePicked
                              ? DecorationImage(
                                  image: FileImage(state.imageFile),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: state is! ProfileImagePicked
                            ? const Icon(
                                color: Colors.white,
                                Icons.add,
                                size: 46,
                              )
                            : null,
                      ),
                    );
                  },
                ),
                const Text(
                  'Seif Moustafa',
                  style: Styles.textStyle14,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
