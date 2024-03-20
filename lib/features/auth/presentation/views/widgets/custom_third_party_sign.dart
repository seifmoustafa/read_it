import 'package:flutter/material.dart';
import 'package:read_it/core/utils/styles.dart';
import 'package:read_it/features/auth/presentation/views/widgets/custom_sing_button.dart';

class CustomThirdPartySign extends StatelessWidget {
  const CustomThirdPartySign({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 45),
          child: Text(
            'Or Sign with',
            style: Styles.textStyle16,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 67),
          child: Row(
            children: [
              CustomSingButton(
                icon: Icons.facebook,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
