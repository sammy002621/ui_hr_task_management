import 'package:flutter/material.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/profile/widgets/profile_element.dart';

class ListContainer extends StatelessWidget {
  final List<Widget> children;
  const ListContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffF4F6F9),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(right: 5,left: 20,bottom: 10, top: 20),
        child: Flexible(
            child: Column(
          children: children
        )),
      ),
    );
  }
}
