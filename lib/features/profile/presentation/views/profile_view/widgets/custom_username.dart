import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/features/profile/presentation/manage/profile_cubit/profile_cubit.dart';

class CustomUserName extends StatelessWidget {
  const CustomUserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: BlocProvider.of<ProfileCubit>(context).fetchUserName(),
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
    );
  }
}
