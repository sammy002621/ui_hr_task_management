import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workmate/core/configs/assets/app_icons.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/home/widgets/clock_in_out_card.dart';
import 'package:workmate/presentation/home/widgets/custom_card.dart';
import 'package:workmate/presentation/home/widgets/total_working_hour.dart';

class ClockInPage extends StatelessWidget {
   ClockInPage({super.key});

  final cards = [
  TotalWorkingHour(
    title: 'Total Working Hour',
    subtitle: 'Paid Period 1 Sept 2024 - 30 Sept 2024',
    widget: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: CustomCard(
          title: 'Today', 
          description: "00:00 Hrs",
          widget: Image.asset(
            AppIcons.time_icon,
            width: 20,
            height: 20,
            fit: BoxFit.cover,
            ),
          ),),
const SizedBox(width: 10,),
          Flexible(
            flex: 1,
            child:CustomCard(
          title: 'Pay Period', 
          description: "32:00 Hrs",
          widget: Image.asset(
            AppIcons.time_icon,
            width: 20,
            height: 20,
            fit: BoxFit.cover,
            ),
          ), )
      ],
    ),
    ),
   ClockInOutCard(
                          date: "27 September 2024",
                          totalHours: "08:00 hrs",
                          duration: "09:00 — 05:00 PM",
                        ),

    ClockInOutCard(
                          date: "26 September 2024",
                          totalHours: "08:00 hrs",
                          duration: "09:00 — 05:00 PM",
                        ),


    ClockInOutCard(
                          date: "25 September 2024",
                          totalHours: "08:10 hrs",
                          duration: "09:00 — 05:00 PM",
                        ),
  ];

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
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                    "Let’s Clock-In!",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                              SizedBox(
                                child: Text(
                                "Don’t miss your clock in schedule",
                                style: GoogleFonts.roboto(
                                    color: const Color(0xffD9D6FE),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
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
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: screenHeight * 0.62,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: cards.length, // Replace with the actual number of cards
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        cards[index],
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ),
            ),

            // the list view column with the total hours and clock in & out details
          ],
        ));
  }
}
