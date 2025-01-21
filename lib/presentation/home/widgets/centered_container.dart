import 'package:flutter/material.dart';

class CenteredContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Color bgColor;
  final double? padding;
  final double? borderRadius;
  final double? paddingRight;
  final double? paddingLeft;
  final double? paddingTop;
  final double? paddingBottom;
  const CenteredContainer(
      {super.key,
      required this.child,
      required this.width,
      required this.height,
      required this.bgColor,
      this.padding,
      this.borderRadius,
      this.paddingTop,
      this.paddingRight,
      this.paddingBottom,
      this.paddingLeft
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding ?? 5 , bottom: padding ?? 5, right: padding ?? 5, left: padding ?? 5),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(borderRadius ?? 60)),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
