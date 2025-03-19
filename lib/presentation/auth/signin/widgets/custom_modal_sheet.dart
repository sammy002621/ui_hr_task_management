import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/common/constants/context_measurements.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/home/widgets/centered_container.dart';

class CustomModalSheet extends StatelessWidget {
  final String iconPath;
  final String title;
  final Widget description;
  final Widget? content;
  final Widget? belowTextField;
  final Widget button1;
  final Widget? messageText;
  final Widget? button2;
  final bool isTextOrButton;
  final double? descriptionHeight;
  final double? otpHeight;
  final double? belowTextFieldHeight;
  final double? belowButton1height;
  final double? belowTextOrButtonHeight;
  final double? topPosition;
  const CustomModalSheet({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    this.belowTextField,
    required this.button1,
    this.messageText,
    this.button2,
    required this.isTextOrButton,
    this.content,
    this.descriptionHeight,
    this.otpHeight,
    this.belowTextFieldHeight,
    this.belowButton1height,
    this.belowTextOrButtonHeight,
    this.topPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          clipBehavior: Clip.none,
          // shrinkWrap: true, // Ensure ListView doesn't take unnecessary space
          children: [
            // testing if i put a stack as a child in the listview
            //

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  // Allow internal scrolling
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 55),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.headerColor,
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          width: 350,
                          child: description,
                        ),
                      ),
                      SizedBox(height: descriptionHeight ?? 20),
                      content ?? SizedBox.shrink(),
                      SizedBox(height: otpHeight ?? 20),
                      belowTextField ?? SizedBox.shrink(),
                      SizedBox(height: belowTextFieldHeight ?? 35),
                      button1,
                       SizedBox(height:belowButton1height ?? 20),
                      isTextOrButton
                          ? messageText ?? SizedBox.shrink()
                          : button2 ?? SizedBox.shrink(),
                       SizedBox(height:belowTextOrButtonHeight ?? 20),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top:topPosition ?? -65,
              left: context.parentWidth * 0.35,
              child: CenteredContainer(
                  borderRadius: 20,
                  width: 100,
                  height: 100,
                  bgColor: AppColors.primaryColor,
                  child: SvgPicture.asset(iconPath)),
            ),
          ],
        ));
  }
}
