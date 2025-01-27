import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/core/configs/assets/app_icons.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/home/widgets/clock_in_out_card.dart';
import 'package:workmate/presentation/home/widgets/custom_card.dart';
import 'package:workmate/presentation/home/widgets/custom_list_view.dart';
import 'package:workmate/presentation/home/widgets/half_background_container.dart';
import 'package:workmate/presentation/home/widgets/total_working_hour.dart';

class ClockInPage extends StatelessWidget {
  ClockInPage({super.key});


  
 

 

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
      final cards = [
    TotalWorkingHour(
        title: 'Total Working Hour',
        subtitle: RichText(
          text: TextSpan(
            text: 'Paid Period 1 Sept 2024 - 30 Sept 2024',
            style: TextStyle(
             color: AppColors.descriptionColor,
            fontSize: 16,
            fontWeight: FontWeight.w500
            )
          ) 
        ),
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             CustomCard(
                width: screenWidth * 0.42,
                title: 'Today',
                description: "00:00 Hrs",
                widget: SvgPicture.asset(
                  AppVectors.clock_logo,
                  width: 22,
                  height: 22,
                ),
              ),
            
            
             CustomCard(
                width: screenWidth * 0.42,
                title: 'Pay Period',
                description: "32:00 Hrs",
                widget: SvgPicture.asset(
                  AppVectors.clock_logo,
                  width: 22,
                  height: 22,
                ),
              ),
          
          ],
        ),
        button: CustomButton(
            title: 'Clock In',
            onTap: () {},
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60)),

    ClockInOutCard(
      date: "27 September 2024",
      title1: 'Total Hours',
      subtitle1: '08:00:00 hrs',
      title2: 'Duration',
      subtitle2: '09:00 — 05:00 PM',
    ),
    ClockInOutCard(
      date: "26 September 2024",
      title1: 'Total Hours',
      subtitle1: '08:00:00 hrs',
      title2: 'Duration',
      subtitle2: '09:00 — 05:00 PM',
    ),
    ClockInOutCard(
      date: "25 September 2024",
      title1: 'Total Hours',
      subtitle1: '08:00:00 hrs',
      title2: 'Duration',
      subtitle2: '09:00 — 05:00 PM',
    ),
  ];
    return Scaffold(
        backgroundColor: const Color(0xffEAECF0),
        body: Stack(
          children: [
            // container with the clock in logo
            HalfBackgroundContainer(
                title: 'Let’s Clock-In!',
                subTitle: 'Don’t miss your clock in schedule',
                widget: SvgPicture.asset(
                  AppVectors.clock_in_out_logo,
                )),

            CustomListView(cards: cards)

            // the list view column with the total hours and clock in & out details
          ],
        ));
  }
}
