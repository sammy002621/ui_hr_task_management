import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class ClockInPage extends StatelessWidget {
  const ClockInPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffEAECF0),
      body: Stack(
        children: [
          // container with the clock in logo 

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: screenHeight * 0.35,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              ),


              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      
                      children: [
                        // header and description texts 
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // header 

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                              "Let’s Clock-In!",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                              
                            ),
                              ],
                            ),



Text(
                              "Don’t miss your clock ",
                              style: GoogleFonts.roboto(
                                color: const Color(0xffD9D6FE),
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),
                            )

                          ],
                        )
                      ],
                    ),

                    Row(
                      children: [
                        // clock in image

                        SvgPicture.asset(
                          AppVectors.clock_in_out_logo,
                          width: 90,
                          height: 90,
                          )
                      ],
                    )
                  ],
                ),
                ),
            ),
          ),


          Align(
            child: Flexible(
              child:SingleChildScrollView(
                child: ListView(
                  children: [
                    // clock in 



                    // clock in and clock outs 
                  ],
                ),
              ) 
            ),
          )




          // the list view column with the total hours and clock in & out details 
        ],
      )
    );
  }
}