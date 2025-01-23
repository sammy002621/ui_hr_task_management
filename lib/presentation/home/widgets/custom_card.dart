import 'package:flutter/material.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget? widget;
  final String title;
  final String description;
  const CustomCard({super.key, this.widget, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffF9FAFB),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: const Color(0xffEAECF0))),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // widget and title

            Row(
              children: [
                // widget
                widget ?? SizedBox.shrink(),
                const SizedBox(
                  width: 5,
                ),
                // text

                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.descriptionColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),


            const SizedBox(height: 10,),
            Text(
                  description,
                  style: TextStyle(
                    color: const Color(0xff161B23),
                    fontWeight: FontWeight.w700,
                    fontSize: 19,
                  ),
                ),



            // anything else
          ],
        ),
      ),
    );
  }
}
