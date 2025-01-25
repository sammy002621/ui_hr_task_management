import 'package:flutter/material.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/home/widgets/custom_avatar_stack.dart';
import 'package:workmate/presentation/home/widgets/tab_item.dart';
import 'package:workmate/presentation/home/widgets/task.dart';
import 'package:workmate/presentation/home/widgets/today_meeting.dart';
import 'package:workmate/presentation/home/widgets/today_task.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
      children: [
      
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            child: Container(
              height: 55,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60)),
                color: Colors.white,
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                tabs: [
                  TabItem(title: "All", count: '2'),
                  TabItem(title: "Progress", count: '0'),
                  TabItem(title: "Finish", count: '2'),
                ],
              ),
            ),
          ),
        
        Expanded(
          child: TabBarView(
            children: [
              Flexible(
                child: ListView(
                  children: [
                    Task(
                      title: "Wiring Dashboard Analytics",
                      profiles: CustomAvatarStack(),
                    ),
                    const SizedBox(height: 20),
                    Task(
                      title: "Wiring Dashboard Analytics",
                      profiles: CustomAvatarStack(),
                    ),
                  ],
                ),
              ),
              Center(child: Text("No Progress Tasks")),
              Flexible(
                child: ListView(
                  children: [
                    
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
            ],
          ),
        ),
      ],
    ),
    );
  }
}
