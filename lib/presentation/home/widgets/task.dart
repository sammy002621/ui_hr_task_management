import 'package:flutter/material.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/home/widgets/centered_container.dart';
import 'package:workmate/presentation/home/widgets/flag.dart';

class Task extends StatelessWidget {
  final String title;
  final Widget profiles;
  const Task({super.key, required this.title, required this.profiles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: 357,
        height: 220,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffEAECF0), width: 2.0),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.bgColor),
        child: Padding(
          padding: const EdgeInsets.all(10),
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
                            Icons.electric_bolt_sharp,
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
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  
                ],
              ),
              const SizedBox(
                height: 20,
              ),



Row(
                    
                    children: [
                     // flags
                     Flag (iconColor: const Color(0xffD0D5DD), icon: Icons.access_time, iconTitle: "In Progress", textColor:AppColors.descriptionColor ,color: const Color(0xffEAECF0),paddingHor: 10,),
                     const SizedBox(width: 10,),
                     Flag (iconColor:  Colors.white, icon: Icons.flag, iconTitle: "High", textColor:const Color(0xffFFFFFF) ,color: const Color(0xffF95555),paddingHor: 10,)
                    ],
                  ),





            const SizedBox(height: 20,),


            LinearProgressIndicator(
              value: 0.75,
              backgroundColor: const Color(0xffE7E7E7),
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              minHeight: 7,
              borderRadius: BorderRadius.circular(5),
            ),



            const SizedBox(height: 30,),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // profiles 

                Row(
                  children: [

                 SizedBox(
                      width: 100,
                      height: 45,
                      child: profiles,
                    )


                  ],
                ),



                // date & messages 

                Row(
                  children: [
                    // date
Flag(iconColor: const Color(0xffD0D5DD), icon: Icons.date_range_rounded, iconTitle: "27 April", textColor: const Color(0xff101828), color: Colors.white,paddingHor: 18,paddingVert: 10,),
const SizedBox(width: 10,),
Flag(iconColor: const Color(0xffD0D5DD), icon: Icons.message, iconTitle: "2", textColor: const Color(0xff101828), color: Colors.white,paddingHor: 18,paddingVert: 10,),


                    // messages 
                  ],
                )
              ],
            )    
            ],
          ),
        ),
      ),
    );
  }
}
