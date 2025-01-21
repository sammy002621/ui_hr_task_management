import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/common/background/gradient_background.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(child: Stack(
        children: [
// image1

          Align(
            alignment: const Alignment(0, -0.85),
            child: SvgPicture.asset(
              AppVectors.today_task_1_onboarding,
              width: 350,
              
            ),
          ),

// image 2
          Positioned(
            top:75,
            right: -13,
            child: SvgPicture.asset(
              
              AppVectors.working_period_onboarding,
              width: 400,
              
            )),

          
// header
          Align(
            alignment: const Alignment(0, 0.3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 SizedBox(
                  width: 340,
                  child:Text(
                  "Navigate Your Work Journey Efficient & Easy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.headerColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                  ) ,),
                const SizedBox(
                  height: 20,
                ),
                 SizedBox(
                  width: 350,
                  child: Text(
                    "Increase your work management & career development radically",
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
      )),
    );
  }
}
