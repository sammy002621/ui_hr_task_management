import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signin/widgets/label_textfield.dart';
import 'package:workmate/presentation/home/widgets/centered_container.dart';
import 'package:workmate/application/validators/signup_validators.dart';
import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:workmate/presentation/profile/widgets/custom_drop_down.dart';

class WorkProfilePage extends StatelessWidget {
   WorkProfilePage({super.key});

  TextEditingController sampleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? selectedPosition;
  final List<String> _list = [
    'Developer',
    'Designer',
    'Consultant',
    'Student',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F3FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'My Work Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: CenteredContainer(
            width: 20,
            height: 20,
            bgColor: const Color(0xffF4F3FF),
            child: Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 35,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: ListView(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Personal Data Information",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Your personal data information",
                              style: TextStyle(
                                color: const Color(0xff667085),
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        DottedBorder(
                          color: const Color(0xffBDB4FE),
                          strokeWidth: 2.0,
                          dashPattern: [10, 7],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          child: CenteredContainer(
                            width: 150,
                            height: 150,
                            bgColor: const Color(0xffFAFAFF),
                            borderRadius: 0,
                            padding: 0,
                            child: SvgPicture.asset(
                              AppVectors.work_profile_logo,
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // upload photo text

                        Text(
                          "Upload Photo",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        SizedBox(
                          width: 300,
                          child: Text(
                            "Format should be in .jpeg .png atleast 800x800px and less than 5MB",
                            style: TextStyle(
                                color: const Color(0xff667085), fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(
                          height: 40,
                        ),

                        LabelTextfield(
                          label: "First Name",
                          hintText: "Tonald",
                          prefixIcon: Icons.person,
                          padding: 3,
                          textController: sampleController,
                        ),

                        const SizedBox(
                          height: 25,
                        ),

                        LabelTextfield(
                          label: "Last Name",
                          hintText: "Drump",
                          prefixIcon: Icons.person,
                          padding: 3,
                          textController: sampleController,
                        ),

                        const SizedBox(
                          height: 25,
                        ),

                        LabelTextfield(
                          label: "Date of Birth",
                          hintText: "Date of Birth",
                          prefixIcon: Icons.calendar_month_rounded,
                          suffixIcon: Icons.keyboard_arrow_down_rounded,
                          padding: 3,
                          textController: sampleController,
                        ),

                        const SizedBox(
                          height: 25,
                        ),

                        // LabelTextfield(
                        //   label: "Position",
                        //   hintText: "Select Position",
                        //   prefixIcon: Icons.newspaper_outlined,
                        //   suffixIcon: Icons.keyboard_arrow_down_rounded,
                        //   padding: 3,
                        //   textController: sampleController,
                        // ),

                        CustomDropdown(
              label: "Position",
              hintText: "Select Position",
              prefixIcon: Icons.work_outline,
              items: _list,
              selectedItem: selectedPosition,
              onChanged: (value) {
                selectedPosition = value;
                print("Selected Position: $value");
              },
            ),

                        const SizedBox(
                          height: 30,
                        ),

                        CustomButton(
                            title:Text(
              'Update Profile',
              style: TextStyle(
                fontSize:  20,
                color:  Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
                            onTap: () {},
                            width: 340,
                            height: 60)
                      ],
                    ),
                    Positioned(
                      top: 60,
                      left: MediaQuery.of(context).size.width *
                          0.55, // Using FractionalOffset instead
                      child: CenteredContainer(
                        width: 45,
                        height: 45,
                        bgColor: AppColors.primaryColor,
                        child: SvgPicture.asset(
                          AppVectors.work_profile_arrow,
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
