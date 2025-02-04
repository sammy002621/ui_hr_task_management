import 'package:flutter/material.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/home/widgets/centered_container.dart';

class Meeting extends StatelessWidget {
  final String title;
  final String time;
  final Widget profiles;
  const Meeting({super.key, required this.title, required this.time, required this.profiles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffEAECF0), width: 2.0),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.bgColor),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // video , title time
                      CenteredContainer(
                          width: 30,
                          height: 30,
                          bgColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.videocam,
                            color: Colors.white,
                            size: 18,
                          )),

                      const SizedBox(
                        width: 5,
                      ),

                      Text(
                        title,
                        style: TextStyle(
                            color: const Color(0xff2B2B2B),
                            fontWeight: FontWeight.w600,
                            fontSize: 17),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // time
 Text(
    time,
    style: TextStyle(
      color: AppColors.descriptionColor,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
  ),

                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // people

                  Row(
                    
                    children: [
                      // image 
                     SizedBox(
                      width: 80,
                      height: 45,
                      child: profiles,
                    )


                      // number
                    ],
                  ),

                  // join meeting
                  CustomButton(title: "Join Meet", onTap: (){}, width: 85, height: 35,fontWeight: FontWeight.w500,fontSize: 14,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
