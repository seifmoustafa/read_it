import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:read_it/features/auth/presentation/manage/login_cubit/login_cubit.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_sing_button.dart';

class CustomThirdPartySign extends StatelessWidget {
  const CustomThirdPartySign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 45),
          child: Text(
            'Or Sign with',
            style: Styles.textStyle16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 46),
          child: Row(
            children: [
              // CustomSingButton(
              //   onPressed: () {
              //     BlocProvider.of<LoginCubit>(context).signInWithFacebook();
              //   },
              //   icon: FontAwesomeIcons.facebook,
              // ),
              CustomSingButton(
                onPressed: () {
                  BlocProvider.of<LoginCubit>(context).signInWithGoogle();
                },
                icon: FontAwesomeIcons.google,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
