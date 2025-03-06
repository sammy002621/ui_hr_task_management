import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/common/background/gradient_background.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GradientBackground(
        child: Stack(
        children: [
// image1

          Align(
            alignment: const Alignment(0, -0.85),
            child: SvgPicture.asset(
              AppVectors.today_task_onboarding,
              width: MediaQuery.of(context).size.width * 0.9,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),

// image 2
          Align(
            alignment: const Alignment(0.6, -0.6),
            child: SvgPicture.asset(
              AppVectors.today_task_onboarding,
              width: MediaQuery.of(context).size.width * 0.9,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),

          
// header
          Align(
            alignment:  Alignment(0, screenHeight > 700 ? 0.25 : 0.3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Manage Stress Effectively",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.headerColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  ),
                const SizedBox(
                  height: 20,
                ),
                 SizedBox(
                  width: 350,
                  child: Text(
                    "Stay Balanced! Track your workload and maintain a healthy stress level with ease.",
                    style: TextStyle(
                      color:AppColors.descriptionColor ,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    ),
                )
              ],
            ),
          )

// description
        ],
      )),
    );
  }
}
