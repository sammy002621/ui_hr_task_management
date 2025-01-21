import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfileElement extends StatelessWidget {
  final Icon prefixIcon;
  final String title;
  final IconButton? suffixIcon;
  const ProfileElement(
      {super.key, required this.prefixIcon, required this.title, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // icon and title

              prefixIcon,

              const SizedBox(
                width: 15,
              ),

              Text(
                title,
                style: TextStyle(
                  color: const Color(0xff4F5464),
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              )
            ],
          ),
          Row(
            children: [
// suffix icon

suffixIcon ?? SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }
}
