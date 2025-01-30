import 'package:flutter/material.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget? widget;
  final String title;
  final String description;
  final double? width;
  const CustomCard(
      {super.key, this.widget, required this.title, required this.description, this.width});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return FittedBox(
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: const Color(0xffF9FAFB),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2, color: const Color(0xffEAECF0))),
        child: Padding(
          padding: const EdgeInsets.all(10),
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

                   Expanded(  // Add this
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.descriptionColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        overflow: TextOverflow.ellipsis,
      ),),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
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
      ),
    );
  }
}
