import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:workmate/core/configs/assets/app_images.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/home/bloc/cubit/navigation_cubit.dart';
import 'package:workmate/presentation/home/pages/clock_in_page.dart';
import 'package:workmate/presentation/home/pages/task_progress_page_1.dart';
import 'package:workmate/presentation/home/pages/home_page.dart';
import 'package:workmate/presentation/home/pages/leave_page.dart';
import 'package:workmate/presentation/home/pages/expense_status_page.dart';
import 'package:workmate/presentation/home/widgets/centered_container.dart';
import 'package:workmate/presentation/home/widgets/custom_avatar_stack.dart';
import 'package:workmate/presentation/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:workmate/presentation/home/widgets/meeting.dart';
import 'package:workmate/presentation/home/widgets/task.dart';
import 'package:workmate/presentation/home/widgets/today_meeting.dart';
import 'package:workmate/presentation/home/widgets/today_task.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = [
      HomePage(),
      ClockInPage(),
      TaskProgressPage(),
      ExpenseStatusPage(),
      LeavePage()
    ];
    return BlocBuilder<NavigationCubit,int>(
        builder:(context,selectedIndex){
          return Scaffold(
            body:widgetOptions[selectedIndex] ,
            bottomNavigationBar: CustomBottomNavigationBar(
              selectedIndex: selectedIndex, 
              onTap: (value) {
            context.read<NavigationCubit>().updateIndex(value);
          })
          );
        } 
    );
  }
}



// create a global variable in the cubit  so that each time it's updated the page that is listening for changes will be automatically updated 