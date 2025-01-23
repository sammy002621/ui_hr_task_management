import 'package:flutter/material.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class TotalWorkingHour extends StatelessWidget {
  final String title;
  final RichText subtitle;
  final Widget? widget;
  final Widget? button;
  final Widget? buttonWidget;
  final double? headerSpace;
  final double? aboveWidgetSpace;
  final double? belowWidgetSpace;
  const TotalWorkingHour({
    super.key,
    required this.title,
    required this.subtitle,
    this.widget,
    this.button,
    this.buttonWidget,
    this.headerSpace,
    this.aboveWidgetSpace,
    this.belowWidgetSpace,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title row
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xff101828),
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(
                  width: 10,
                ),
                buttonWidget ??
                    const SizedBox
                        .shrink() // Replace with your custom widget if needed
              ],
            ),
            SizedBox(
              height: headerSpace ?? 0,
            ),
            // subtitle
            subtitle,

            SizedBox(
              height: aboveWidgetSpace ?? 15,
            ),
            // widget
            widget ?? const SizedBox.shrink(),

             SizedBox(
              height: belowWidgetSpace ?? 15,
            ),

            // optional button
            button ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
