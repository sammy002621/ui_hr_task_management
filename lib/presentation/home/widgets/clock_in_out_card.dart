import 'package:flutter/material.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class ClockInOutCard extends StatelessWidget {
  final String date;
  final String totalHours;
  final String duration;
  const ClockInOutCard(
      {super.key, 
      required this.date, 
      required this.totalHours,
      required this.duration
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // date
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Text(
              date,
              style: TextStyle(
                color: const Color(0xff101828),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            ],
           ),

            const SizedBox(
              height: 20,
            ),

            // total hours and clock in and out details
// 
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xffF9FAFB),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xffEAECF0),
                    width: 2,
                  )
                  
                  ),
                  
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // total hours

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                              "Total Hours",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                              ],
                            ),

                            Row(
                              
                              children: [
                                Text(
                              totalHours,
                              style: TextStyle(
                                color: const Color(0xff344054),
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
//clock in & out

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // total hours

                            Text(
                              "Clock in & Out",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),

                            Text(
                              duration,
                              style: TextStyle(
                                color: const Color(0xff344054),
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
