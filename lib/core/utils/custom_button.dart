import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.borderRadius,
    required this.backGroundColor,
    required this.text,
    required this.textColor,
    required this.fontSize,
  });
  final BorderRadius? borderRadius;
  final Color backGroundColor;
  final String text;
  final Color textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(16),
            ),
            backgroundColor: backGroundColor),
        onPressed: () {},
        child: Text(
          text,
          style: Styles.titleStyle20.copyWith(
            fontWeight: FontWeight.w900,
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
