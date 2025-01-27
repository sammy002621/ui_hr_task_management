import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/home/widgets/clock_in_out_card.dart';
import 'package:workmate/presentation/home/widgets/custom_avatar_stack.dart';
import 'package:workmate/presentation/home/widgets/custom_card.dart';
import 'package:workmate/presentation/home/widgets/custom_list_view.dart';
import 'package:workmate/presentation/home/widgets/custom_tab_bar.dart';
import 'package:workmate/presentation/home/widgets/fitted_total_working_hour.dart';
import 'package:workmate/presentation/home/widgets/half_background_container.dart';
import 'package:workmate/presentation/home/widgets/task.dart';

class ExpenseStatusPage extends StatelessWidget {
  const ExpenseStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final List<Widget> cards = [
      FittedTotalWorkingHour(
      title: 'Total Expense',
      subtitle: RichText(
        text: TextSpan(
          text: 'Period 1 Jan 2024 - 30 Dec 2024',
          style: TextStyle(
            color: AppColors.descriptionColor,
            fontSize: 16,
            fontWeight: FontWeight.w500
          )
        ),
      ),
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            CustomCard(
              width: screenWidth * 0.29,
              title: 'Total',
              description: '\$1010', 
              widget: SvgPicture.asset(
                AppVectors.task_progress_code,
                width: 18,
                height: 18,

    
                ),
            ),
           
          

           CustomCard(
              width: screenWidth * 0.3,
              title: 'Review',
              description: '\$455',
              widget: SvgPicture.asset(
                AppVectors.task_progress_time,
                 width: 18,
                height: 18,
                ),
            ),
        



           CustomCard(
                width: screenWidth * 0.31,
                title: 'Allowed',
                description: '\$555',
                widget: SvgPicture.asset(
                  AppVectors.task_progress_done,
                   width: 18,
                  height: 18,
                  ),
              ),
          
          
        ],
      ),

     
    ),



    SizedBox(
  height: screenHeight * 0.5,
  child: CustomTabBar(
    title1: 'Review',
    title2: 'Agreed',
    title3: 'Denied',
    children1: [
      ClockInOutCard(
                        date: "27 September 2024",
                        title1: 'Type',
                        subtitle1: 'E-Learning',
                        title2: 'Total Expense',
                        subtitle2: '\$55',
                        image: SvgPicture.asset(
                          AppVectors.expense_status_date,
                          width: 25,
                          height: 25,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ClockInOutCard(
                        date: "24 September 2024",
                        title1: 'Type',
                        subtitle1: 'E-Learning',
                        title2: 'Total Expense',
                        subtitle2: '\$55',
                        image: SvgPicture.asset(
                          AppVectors.expense_status_date,
                          width: 25,
                          height: 25,
                        ),
                      ),
const SizedBox(height: 20),

                      ClockInOutCard(

                        date: "21 September 2024",
                        title1: 'Type',
                        subtitle1: 'E-Learning',
                        title2: 'Total Expense',
                        subtitle2: '\$55',
                        image: SvgPicture.asset(
                          AppVectors.expense_status_date,
                          width: 25,
                          height: 25,
                        ),
                      ),
                      
    ],



    children2: [
     ClockInOutCard(
                        date: "27 September 2024",
                        title1: 'Type',
                        subtitle1: 'E-Learning',
                        title2: 'Total Expense',
                        subtitle2: '\$55',
                        image: SvgPicture.asset(
                          AppVectors.expense_status_date,
                          width: 25,
                          height: 25,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ClockInOutCard(
                        date: "24 September 2024",
                        title1: 'Type',
                        subtitle1: 'E-Learning',
                        title2: 'Total Expense',
                        subtitle2: '\$55',
                        image: SvgPicture.asset(
                          AppVectors.expense_status_date,
                          width: 25,
                          height: 25,
                        ),
                      ),

    ],


    children3: [
       ClockInOutCard(
                        date: "27 September 2024",
                        title1: 'Type',
                        subtitle1: 'E-Learning',
                        title2: 'Total Expense',
                        subtitle2: '\$55',
                        image: SvgPicture.asset(
                          AppVectors.expense_status_date,
                          width: 25,
                          height: 25,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ClockInOutCard(
                        date: "24 September 2024",
                        title1: 'Type',
                        subtitle1: 'E-Learning',
                        title2: 'Total Expense',
                        subtitle2: '\$55',
                        image: SvgPicture.asset(
                          AppVectors.expense_status_date,
                          width: 25,
                          height: 25,
                        ),
                      ),
const SizedBox(height: 20),


    ],
  ),
  )
    ];

    return Scaffold(
        backgroundColor: const Color(0xffEAECF0),
        body: Stack(
          children: [
            // container with the clock in logo
            HalfBackgroundContainer(
                title: 'Expense Summary',
                subTitle: 'Claim your expenses here.',
                widget: SvgPicture.asset(
                  AppVectors.clock_in_out_logo,
                )),

            CustomListView(cards: cards),
          ],
        ));
  }
}
