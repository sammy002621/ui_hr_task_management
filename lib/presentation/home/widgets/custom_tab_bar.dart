import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/home/widgets/clock_in_out_card.dart';
import 'package:workmate/presentation/home/widgets/custom_avatar_stack.dart';
import 'package:workmate/presentation/home/widgets/tab_item.dart';
import 'package:workmate/presentation/home/widgets/task.dart';
import 'package:workmate/presentation/home/widgets/today_meeting.dart';
import 'package:workmate/presentation/home/widgets/today_task.dart';

class CustomTabBar extends StatefulWidget {
  final String title1;
  final String title2;
  final String title3;
  final List<Widget> children1;
  final List<Widget> children2;
  final List<Widget> children3;
  const CustomTabBar(
      {super.key,
      required this.title1,
      required this.title2,
      required this.title3,
      required this.children1,
      required this.children2,
      required this.children3,
      });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                tabs: [
                  TabItem(title: widget.title1, count: '3'),
                  TabItem(title: widget.title2, count: '2'),
                  TabItem(title: widget.title3, count: '2'),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Flexible(
                  child: ListView(
                    children: widget.children1
                  ),
                ),
                Flexible(
                  child: ListView(
                    children:widget.children2
                  ),
                ),
                Flexible(
                  child: ListView(
                    children:widget.children3
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
