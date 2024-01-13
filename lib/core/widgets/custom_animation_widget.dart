import 'package:flutter/material.dart';

class CustomAnimationWidgets extends StatefulWidget {
  const CustomAnimationWidgets({super.key, required this.child});
  final Widget child;
  @override
  State<CustomAnimationWidgets> createState() {
    return _CustomAnimationWidgets();
  }
}

class _CustomAnimationWidgets extends State<CustomAnimationWidgets>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 800));
    animation = Tween<double>(begin: .2, end: .8).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
    animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}
