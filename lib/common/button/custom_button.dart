import 'package:flutter/material.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Widget title;
  final double width;
  final double height;
  final double? padding;
  final double? fontSize;
  FontWeight? fontWeight;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final void Function()? onTap;

  CustomButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.width,
      required this.height,
      this.padding,
      this.fontWeight,
      this.fontSize,
      this.color,
      this.textColor,
      this.borderColor,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? Color.fromARGB(255, 60, 21, 218),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 1),
          child: Center(
            child: title,
          ),
        ),
      ),
    );
  }
}
