import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:read_it/features/profile/presentation/manage/profile_cubit/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileCubit(),
        child: const ProfileViewBody(),
      ),
    );
  }
}
