import 'package:flutter/material.dart';
import 'package:read_it/core/utils/styles.dart';

class ContainerDetails extends StatelessWidget {
  const ContainerDetails({
    super.key,
    required this.firstIcon,
    required this.action,
    required this.actionColor,
    required this.secIcon,
    this.onTap,
  });

  final IconData? firstIcon;
  final String action;
  final Color? actionColor;
  final IconData? secIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.grey.withOpacity(.3),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(firstIcon),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                action,
                style: Styles.textStyle16.copyWith(
                  color: actionColor ?? Colors.black,
                ),
              ),
              secIcon != null
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                    )
                  : const SizedBox(
                      width: 16,
                    ),
              const Spacer(),
              secIcon != null
                  ? CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.5),
                      radius: 20,
                      child: Icon(
                        secIcon,
                      ))
                  : const SizedBox(
                      width: 5,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
