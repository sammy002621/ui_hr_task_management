import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
  final String iconTitle;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final Color color;
  final double? paddingVert;
  final double? paddingHor;
  const Flag(
      {super.key,
      required this.iconColor,
      required this.icon,
      required this.iconTitle,
      required this.textColor,
      required this.color,
      this.paddingVert,
      this.paddingHor,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: paddingVert ?? 5, horizontal: paddingHor ?? 5),
        child: Row(
          children: [
            // icon

            Icon(
              icon,
              color: iconColor,
              size: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            // text

            Text(
              iconTitle,
              style: TextStyle(
                  color: textColor, fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
