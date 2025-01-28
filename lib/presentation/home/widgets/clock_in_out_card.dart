import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class ClockInOutCard extends StatelessWidget {
  final String date;
  final Widget? image;
  final String title1;
  final String title2;
  final String subtitle1;
  final String subtitle2;
  final Widget? messageIcon;
  final Widget? message;
  final Widget? donebyImage;
  final Widget? donebyName;
  final bool? isApprovedOrRejected;
  const ClockInOutCard({
    super.key,
    required this.date,
    this.image,
    required this.title1,
    required this.title2,
    required this.subtitle1,
    required this.subtitle2,
    this.messageIcon,
    this.message,
    this.donebyImage,
    this.donebyName,
    required this.isApprovedOrRejected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // date
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // icon
                image ?? SizedBox.shrink(),
                const SizedBox(
                  width: 10,
                ),
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
              height: 15,
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
                  )),
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
                                  title1,
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
                                  subtitle1,
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
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // total hours

                            Text(
                              title2,
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),

                            Text(
                              subtitle2,
                              style: TextStyle(
                                color: const Color(0xff344054),
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),

                            // approved or rejected message
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // message and icon

                    messageIcon ?? SizedBox.shrink(),

                    const SizedBox(
                      width: 5,
                    ),

                    message ?? SizedBox.shrink()
                  ],
                ),
                Row(
                  children: [
                    // done by message & image

                    isApprovedOrRejected == true ? Text(
                      "by",
                      style: TextStyle(
                            color: const Color(0xff101828),
                            fontWeight: FontWeight.w600,
                            fontSize: 14
                          ),
                      
                      ) : SizedBox.shrink(),

                    const SizedBox(
                      width: 3,
                    ),

                    donebyImage ?? SizedBox.shrink(),
                    
                    const SizedBox(
                      width: 3,
                    ),
                    donebyName ?? SizedBox.shrink()
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
