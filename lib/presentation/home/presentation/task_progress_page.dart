import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/presentation/home/widgets/custom_card.dart';
import 'package:workmate/presentation/home/widgets/custom_list_view.dart';
import 'package:workmate/presentation/home/widgets/half_background_container.dart';
import 'package:workmate/presentation/home/widgets/total_working_hour.dart';

class TaskProgressPage extends StatelessWidget {
  TaskProgressPage({super.key});

  final List<Widget> cards = [
    TotalWorkingHour(
      title: 'Summary of Your Work',
      subtitle: 'Your current task progress',
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex:1 ,
            child: CustomCard(
              title: 'To Do',
              description: "5", 
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            flex: 1,
            child: CustomCard(
              title: 'Progress',
              description: "2",
            
            ),
          ),

const SizedBox(
            width: 5,
          ),


          Flexible(
            flex: 1,
            child: CustomCard(
              title: 'Done',
              description: "1",
              
            ),
          )
        ],
      ),

     
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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

            CustomListView(cards: cards)
          ],
        ));
  }
}
