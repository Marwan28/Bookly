import 'package:bookly/core/utils/my_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final double? fontSize;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.backgroundColor,
    required this.textColor,
     this.borderRadius,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius?? BorderRadius.circular(12),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Text(
          text,
          style: MyStyles.textStyle18.copyWith(
            color: textColor,
            fontWeight: FontWeight.w900,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
