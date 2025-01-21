import 'package:flutter/material.dart';
import 'package:workmate/core/configs/assets/app_images.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/home/presentation/clock_in_page.dart';
import 'package:workmate/presentation/home/presentation/expense_status_page.dart';
import 'package:workmate/presentation/home/presentation/leave_page.dart';
import 'package:workmate/presentation/home/presentation/main_home_screen.dart';
import 'package:workmate/presentation/home/presentation/task_progress_page.dart';
import 'package:workmate/presentation/home/widgets/centered_container.dart';
import 'package:workmate/presentation/home/widgets/custom_avatar_stack.dart';
import 'package:workmate/presentation/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:workmate/presentation/home/widgets/meeting.dart';
import 'package:workmate/presentation/home/widgets/task.dart';
import 'package:workmate/presentation/home/widgets/today_meeting.dart';
import 'package:workmate/presentation/home/widgets/today_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffF1F3F8),
      body: Column(
        children: [
          // profile info
          Container(
            height: screenHeight * 0.15,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.asset(
                          AppImages.profile,
                          fit: BoxFit.cover,
                          width: 70,
                          height: 70,
                        ),
                      ),
                      const SizedBox(width: 15),
                      // profile description
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // name & verification
                              Text(
                                "Tonald Drump",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.verified,
                                color: const Color(0xff675AFF),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          // role
                          Text(
                            "Full Stack Developer",
                            style: TextStyle(
                              color: const Color(0xff6E62FF),
                              fontSize: 16,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Row(
                    children: [
                      CenteredContainer(
                        width: 50,
                        height: 50,
                        bgColor: const Color(0xffF4F5FF),
                        child: Icon(
                          Icons.message,
                          color: AppColors.iconColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      CenteredContainer(
                        width: 50,
                        height: 50,
                        bgColor: const Color(0xffF4F5FF),
                        child: Icon(
                          Icons.notifications,
                          color: AppColors.iconColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  Column(
                    children: [
                      // summary
                      Container(
                        width: 370,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff795FFC),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // description
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "My Work Summary",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text(
                                    "Today task & activity",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // camera image

                            Image.asset(
                              AppImages.camera_home,
                              width: 110,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // today meeting
                      TodayMeeting(
                        title: "Today Meeting",
                        subTitle: "Your schedule for the day",
                        number: "2",
                        children: [
                          Meeting(
                            title: "Townhall Meeting",
                            time: "01:30-02:00 AM",
                            profiles: CustomAvatarStack(),
                          ),
                          Meeting(
                            title: "Dashboard Report",
                            time: "01:30-02:00 AM",
                            profiles: CustomAvatarStack(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // today task
                      TodayTask(
                        title: "Today Task",
                        subTitle: "The tasks assigned to you for today",
                        number: "1",
                        height: 340,
                        children: [
                          Task(
                            title: "Wiring Dashboard Analytics",
                            profiles: CustomAvatarStack(),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}