import 'package:flutter/material.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class TotalWorkingHour extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? widget;
  final Widget? button;
  const TotalWorkingHour({super.key, required this.title,  required this.subtitle,this.widget, this.button});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
        ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Text(
              title,
              style: TextStyle(
                color: const Color(0xff101828),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),

            // subtitle

            Text(
              subtitle,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            // widget

            widget ?? SizedBox.shrink(),


const SizedBox(height: 15,),

            // optional button
            button ?? SizedBox.shrink(),
            
          ],
        ),
      ),
    );
  }
}
