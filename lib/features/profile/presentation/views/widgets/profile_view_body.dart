import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/features/profile/presentation/views/widgets/custom_profile_app_bar.dart';
import 'package:read_it/features/profile/presentation/manage/profile_image_cubit/profile_image_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocProvider(
            create: (context) => ProfileimageCubit(),
            child: const CustomProfileAppBar(),
          ),
          const SizedBox(
            height: 51,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 17.0),
            child: Text(
              'Favorite',
              style: Styles.textStyle25,
            ),
          )
        ],
      ),
    );
  }
}
