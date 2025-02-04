import 'package:flutter/material.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class TodayMeeting extends StatelessWidget {
  final String title;
  final String subTitle;
  final String number;
  final List<Widget> children;
  const TodayMeeting(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.number,
      required this.children
      });

  @override
  Widget build(BuildContext context) {
    return Container(
     width: MediaQuery.of(context).size.width ,
      height: 370,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // header & number
            Row(
              children: [
                // header

                Text(
                  title,
                  style: TextStyle(
                      color: const Color(0xff101828),
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      color: const Color(0xffEBE9FE),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      number,
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 19),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(
              height: 5,
            ),
            // subtitle

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  subTitle,
                  style:
                      TextStyle(color: const Color(0xff475467), fontSize: 17),
                )
              ],
            ),

const SizedBox(height: 20,),

            Flexible(
                child: ListView(
              children: children,
            ))
          ],
        ),
      ),
    );
  }
}
