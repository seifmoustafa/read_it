import 'package:flutter/material.dart';
import 'package:read_it/features/profile/presentation/views/widgets/container_details.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.firstIcon,
      required this.action,
      this.actionColor,
      this.secIcon,
      this.onTap});
  final IconData? firstIcon;
  final String action;
  final Color? actionColor;
  final IconData? secIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return secIcon != null
        ? ContainerDetails(
            firstIcon: firstIcon,
            action: action,
            actionColor: actionColor,
            secIcon: secIcon)
        : Center(
            child: ContainerDetails(
                firstIcon: firstIcon,
                action: action,
                actionColor: actionColor,
                secIcon: secIcon));
  }
}
