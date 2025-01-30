import 'package:flutter/material.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  const BottomButton({super.key, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(color: const Color(0xffFEFEFE)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CustomButton(
              title: buttonTitle,
              onTap: () {},
              width: 100,
              height: 30,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          )),
    );
  }
}
