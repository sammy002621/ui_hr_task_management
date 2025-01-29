import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/home/widgets/bottom_button.dart';
import 'package:workmate/presentation/home/widgets/centered_container.dart';
import 'package:workmate/presentation/home/widgets/clock_in_out_card.dart';
import 'package:workmate/presentation/home/widgets/custom_avatar_stack.dart';
import 'package:workmate/presentation/home/widgets/custom_card.dart';
import 'package:workmate/presentation/home/widgets/custom_list_view.dart';
import 'package:workmate/presentation/home/widgets/custom_tab_bar.dart';
import 'package:workmate/presentation/home/widgets/fitted_total_working_hour.dart';
import 'package:workmate/presentation/home/widgets/flag.dart';
import 'package:workmate/presentation/home/widgets/half_background_container.dart';
import 'package:workmate/presentation/home/widgets/task.dart';
import 'package:workmate/presentation/home/widgets/total_working_hour.dart';

class TaskProgressPage extends StatelessWidget {
  TaskProgressPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final List<Widget> cards = [
    FittedTotalWorkingHour(
      title: 'Summary of Your Work',
      subtitle: RichText(
        text: TextSpan(
          text: 'Your current task progress',
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
              width: screenWidth * 0.28,
              title: 'To Do',
              description: "5", 
              widget: SvgPicture.asset(
                AppVectors.task_progress_code,
                width: 16,
                  height: 16,

    
                ),
            ),
           
          

           CustomCard(
              width: screenWidth * 0.35,
              title: 'Progress',
              description: "2",
              widget: SvgPicture.asset(
                AppVectors.task_progress_time,
                 width: 16,
                  height: 16,
                ),
            ),
        



          CustomCard(
                width: screenWidth * 0.27,
                title: 'Done',
                description: "1",
                widget: SvgPicture.asset(
                  AppVectors.task_progress_done,
                   width: 16,
                  height: 16,
                  ),
              ),
          
          
        ],
      ),

     
    ),



TotalWorkingHour(
      title: 'Sprint 20 - Burnout Stats',
      buttonWidget:CenteredContainer(
        width: 60, 
        height: 40, 
        bgColor: const Color(0xffFD824C),
        paddingRight: 10,
        paddingLeft: 10,
        child:Text(
              'Poor',
              style: TextStyle(
                fontSize:  18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )),
      headerSpace: 5,
      subtitle: RichText(
        text: TextSpan(
          text: "You've completed ",
          style: TextStyle(
           color: AppColors.descriptionColor,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            
          ),

          children: <TextSpan>[
            TextSpan(
              text: " 8 more tasks than usual, ",
              style: TextStyle(
                color: const Color(0xff101828),
                fontWeight: FontWeight.w600,
                fontSize: 17
              )
            ),

            TextSpan(
              text: "maintain your task with your supervisor",
              style: TextStyle(
                color: AppColors.descriptionColor,
                fontSize: 17,
              )
            )
          ]
        ),
      ),



// container with progress indicator 





widget: Container(
  decoration: BoxDecoration(
          color: const Color(0xffF9FAFB),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: const Color(0xffEAECF0))),
  child: Padding(padding: const EdgeInsets.all(15),
  child: Row(
    children: [
      // image 

     SvgPicture.asset(AppVectors.task_progress_yellow_face),

     const SizedBox(width: 15,),

      SizedBox(
        width:MediaQuery.of(context).size.width * 0.6,
        child: LinearProgressIndicator(
              value: 0.75,
              backgroundColor: const Color(0xffE7E7E7),
              valueColor: AlwaysStoppedAnimation<Color>(const Color(0xffFD824C)),
              minHeight: 7,
              borderRadius: BorderRadius.circular(5),
            ),
      )
    ],
  ),
  )
  ),


aboveWidgetSpace: 20,
belowWidgetSpace: 10,
),





 SizedBox(
  height: screenHeight * 0.5,
  child: CustomTabBar(
    title1: 'All',
    title2: 'Doing',
    title3: 'Finish',
    count1: '3',
    count2: '2',
    count3: '2',
    children1: [
      Task(
                        title: "Wiring Dashboard Analytics",
                        profiles: CustomAvatarStack(),
                      ),
                      const SizedBox(height: 8),
                      Task(
                        title: "Wiring Dashboard Analytics",
                        profiles: CustomAvatarStack(),
                      ),
                      
const SizedBox(height: 8),
                       Task(
                        title: "Wiring Dashboard Analytics",
                        profiles: CustomAvatarStack(),
                      ),
    ],



    children2: [
      Task(
                        title: "Wiring Dashboard Analytics",
                        profiles: CustomAvatarStack(),
                      ),
                      const SizedBox(height: 8),
                      Task(
                        title: "Wiring Dashboard Analytics",
                        profiles: CustomAvatarStack(),
                      ),
    ],


    children3: [
       Task(
                        title: "Wiring Dashboard Analytics",
                        profiles: CustomAvatarStack(),
                      ),
                      Task(
                        title: "Wiring Dashboard Analytics",
                        profiles: CustomAvatarStack(),
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
                title: 'Challenges Await',
                subTitle: 'Let’s tackle your to do list',
                widget: SvgPicture.asset(
                  AppVectors.clock_in_out_logo,
                )),

            CustomListView(cards: cards),

            BottomButton(buttonTitle: 'Create Task')


            
          ],
        ));
  }
}
