import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/common/background/gradient_background.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child:Stack(
        children: [
// image1

          Align(
            alignment: const Alignment(0, -0.85),
            child: SvgPicture.asset(
              AppVectors.today_task_onboarding,
              width: 350,
            ),
          ),

// image 2
          Align(
            alignment: const Alignment(0.6, -0.5),
            child: SvgPicture.asset(
              AppVectors.today_task_onboarding,
              width: 350,
            ),
          ),

          
// header
          Align(
            alignment: const Alignment(0, 0.3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome to Workmate!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.headerColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                 SizedBox(
                  width: 350,
                  child: Text(
                    "Make Smart Decisions! Set clear timelines for projects and celebrate your achievements!",
                    style: TextStyle(
                      color:AppColors.descriptionColor ,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    
                    ),
                    textAlign: TextAlign.center,
                    ),
                )
              ],
            ),
          )

// description
        ],
      ) ),
    );
  }
}
