import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/core/configs/assets/app_images.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/home/widgets/bottom_button.dart';
import 'package:workmate/presentation/home/widgets/clock_in_out_card.dart';
import 'package:workmate/presentation/home/widgets/custom_avatar_stack.dart';
import 'package:workmate/presentation/home/widgets/custom_card.dart';
import 'package:workmate/presentation/home/widgets/custom_list_view.dart';
import 'package:workmate/presentation/home/widgets/custom_tab_bar.dart';
import 'package:workmate/presentation/home/widgets/fitted_total_working_hour.dart';
import 'package:workmate/presentation/home/widgets/half_background_container.dart';
import 'package:workmate/presentation/home/widgets/rounded_small_container.dart';
import 'package:workmate/presentation/home/widgets/task.dart';
import 'package:workmate/presentation/home/widgets/total_working_hour.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final List<Widget> cards = [
      
TotalWorkingHour(
        title: 'Total Leave',
        subtitle: RichText(
          text: TextSpan(
            text: 'Period 1 Jan 2024 - 30 Dec 2024',
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
                title: 'Available',
                description: "20",
                widget: RoundedSmallContainer(color: const Color(0xff19B36E))
              ),
            
            
             CustomCard(
                width: screenWidth * 0.44,
                title: 'Leave Used',
                description: "2",
                widget: RoundedSmallContainer(color: AppColors.primaryColor)
              ),
          
          ],
        ),),



SizedBox(
  height: screenHeight * 0.5,
  child: CustomTabBar(
    title1: 'Review',
    title2: 'Approved',
    title3: 'Rejected',
    count1: '1',
    count2: '1',
    count3: '1',
    children1: [
      ClockInOutCard(
                        date: "27 September 2024",
                        title1: 'Type',
                        subtitle1: 'E-Learning',
                        title2: 'Total Expense',
                        subtitle2: '\$55',
                        isApprovedOrRejected: false,
                        image: SvgPicture.asset(
                          AppVectors.leave_review_logo,
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
                        isApprovedOrRejected: true,
                        image: SvgPicture.asset(
                          AppVectors.expense_status_date,
                          width: 25,
                          height: 25,
                        ),
                        messageIcon: SvgPicture.asset(
                  AppVectors.task_progress_done,
                   width: 14,
                  height: 14,
                  ),
                        message: Text(
                          'Approved at 19 Sept 2024',
                          
                          style: TextStyle(
                            color: const Color(0xff19B36E),
                            fontWeight: FontWeight.w600,
                            fontSize: 13
                          ),
                          ),

                          donebyImage: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.asset(
                          AppImages.profile,
                          fit: BoxFit.cover,
                           width: 30,
                          height: 30,
                        ),
                      ),
                        donebyName: Text(
                          "Elaine",
                          style: TextStyle(
                            color: const Color(0xff101828),
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                          ),
                          ),
                      ),
                      
                      

    ],


    children3: [
       ClockInOutCard(
                        date: "27 September 2024",
                        title1: 'Type',
                        subtitle1: 'Business Trip',
                        title2: 'Total Expense',
                        subtitle2: '\$100',
                        isApprovedOrRejected: true,
                        message: Text(
                          'Rejected at 28 Sept 2024',
                          
                          style: TextStyle(
                            color: const Color(0xffF95555),
                            fontWeight: FontWeight.w600,
                            fontSize: 13
                          ),
                          ),
                          messageIcon: SvgPicture.asset(
                  AppVectors.expense_status_rejected_logo,
                   width: 14,
                  height: 14,
                  ),
                        image: SvgPicture.asset(
                          AppVectors.expense_status_date,
                          width: 25,
                          height: 25,
                        ),
                        donebyImage: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.asset(
                          AppImages.profile,
                          fit: BoxFit.cover,
                          width: 30,
                          height: 30,
                        ),
                      ),
                        donebyName: Text(
                          "Elaine",
                          style: TextStyle(
                            color: const Color(0xff101828),
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                          ),
                          ),
                      ),
                     
                      


    ],
  ),
  ),      
const SizedBox(height: 20,)

    ];

    return Scaffold(
        backgroundColor: const Color(0xffEAECF0),
        body: Stack(
          children: [
            // container with the clock in logo
            HalfBackgroundContainer(
                title: 'Leave Summary',
                subTitle: 'Submit Leave',
                widget: SvgPicture.asset(
                  AppVectors.clock_in_out_logo,
                )),

            CustomListView(cards: cards),
            BottomButton(buttonTitle: 'Submit Leave')
          ],
        ));
  }
}
