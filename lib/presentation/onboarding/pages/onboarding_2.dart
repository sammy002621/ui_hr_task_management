import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/common/background/gradient_background.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Stack(
        children: [
// image1

          Positioned(
            top:35,
            right: 13,
            child: SvgPicture.asset(
              
              AppVectors.working_period_onboarding,
              width: MediaQuery.of(context).size.width * 0.9,
              
            )),

// image 2
          Align(
            alignment: const Alignment(0, 0.1),
            child: SvgPicture.asset(
              AppVectors.working_period_onboarding,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),

          
// header
          Align(
            alignment: const Alignment(-0.6, 0.4),
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
