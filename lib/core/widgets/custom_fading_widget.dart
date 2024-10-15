import 'package:flutter/material.dart';

class CustomFadingWidget extends StatefulWidget {
  const CustomFadingWidget({super.key, required this.child});
  final Widget child;
  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation =
        Tween<double>(begin: 0.2, end: 0.8).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}
