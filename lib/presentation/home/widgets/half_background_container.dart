import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class HalfBackgroundContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget widget;
  const HalfBackgroundContainer(
      {super.key, required this.title, required this.subTitle,  required this.widget,});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: screenHeight * 0.35,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // header and description texts
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // header

                      Row(
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 230,
                        child: Text(
                          subTitle,
                          style: GoogleFonts.roboto(
                              color: const Color(0xffD9D6FE),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )
                ],
              ),

              Row(
                children: [
                  // clock in image
                  widget,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
