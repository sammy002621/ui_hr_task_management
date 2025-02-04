import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/common/constants/context_measurements.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signup/pages/sign_up_page.dart';
import 'package:workmate/presentation/home/pages/home_page.dart';
import 'package:workmate/presentation/home/pages/main_home_screen.dart';
import 'package:workmate/presentation/home/widgets/centered_container.dart';

// description height
// otp height
// belowTextFieldheight
class CustomModalSheet extends StatefulWidget {
  final String iconPath;
  final String title;
  final RichText description;
  final Widget? content;
  final Widget? belowTextField;
  final Widget button1;
  final Widget? messageText;
  final Widget? button2;
  final bool isTextorButton;
  final double? descriptionheight;
  final double? otpheight;
  final double? belowTextFieldheight;
  final double? belowButton1height;
  final double? belowTextOrButtonheight;
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
    required this.isTextorButton,
    this.content,
    this.descriptionheight,
    this.otpheight,
    this.belowTextFieldheight,
    this.belowButton1height,
    this.belowTextOrButtonheight,
    this.topPosition,
  });

  @override
  State<CustomModalSheet> createState() => _CustomModalSheetState();
}

class _CustomModalSheetState extends State<CustomModalSheet> {
  void _navigateHome() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MainHomeScreen()));
  }

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
                        widget.title,
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
                          child: widget.description,
                        ),
                      ),
                      SizedBox(height: widget.descriptionheight ?? 20),
                      widget.content ?? SizedBox.shrink(),
                      SizedBox(height: widget.otpheight ?? 20),
                      widget.belowTextField ?? SizedBox.shrink(),
                      SizedBox(height: widget.belowTextFieldheight ?? 35),
                      widget.button1,
                       SizedBox(height:widget.belowButton1height ?? 20),
                      widget.isTextorButton
                          ? widget.messageText ?? SizedBox.shrink()
                          : widget.button2 ?? SizedBox.shrink(),
                       SizedBox(height:widget.belowTextOrButtonheight ?? 20),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top:widget.topPosition ?? -65,
              left: context.parentWidth * 0.35,
              child: CenteredContainer(
                  borderRadius: 20,
                  width: 100,
                  height: 100,
                  bgColor: AppColors.primaryColor,
                  child: SvgPicture.asset(widget.iconPath)),
            ),
          ],
        ));
  }
}
