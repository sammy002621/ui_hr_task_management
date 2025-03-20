import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/core/configs/assets/app_images.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signup/bloc/user_cubit.dart';
import 'package:workmate/presentation/auth/signup/bloc/user_state.dart';
import 'package:workmate/presentation/home/widgets/centered_container.dart';
import 'package:workmate/presentation/profile/pages/work_profile_page.dart';
import 'package:workmate/presentation/profile/widgets/list_container.dart';
import 'package:workmate/presentation/profile/widgets/profile_element.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    void _navigateProfilePage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WorkProfilePage()));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
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
            bgColor: Colors.white,
            child: Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 35,
              color: const Color(0xff6E62FF),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xff795FFC),
      body: Stack(
        children: [
          // White background container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 80), // Add padding to account for the profile picture
                child: Column(
                  children: [
                    // Profile information
                    const SizedBox(height: 20),
                    // profile name & verification
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // name & verification
                        Text(
                          "Tonald Drump",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.verified,
                          color: const Color(0xff675AFF),
                        )
                      ],
                    ),

                    const SizedBox(height: 3),
                    // role
                    BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        return Text(
                          state.email,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    // Additional content in a scrollable list

                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "ACCOUNT",
                                style: TextStyle(
                                    color: const Color(0xff344054),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          ListContainer(
                            children: [
                              ProfileElement(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: AppColors.primaryColor,
                                  ),
                                  title: "My Work Profile",
                                  suffixIcon: IconButton(
                                      onPressed: _navigateProfilePage,
                                      icon: Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        size: 30,
                                        color: const Color(0xffB6C2D7),
                                      ))),
                              ProfileElement(
                                  prefixIcon: Icon(
                                    Icons.folder,
                                    color: AppColors.primaryColor,
                                  ),
                                  title: "Office Assets",
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        size: 30,
                                        color: const Color(0xffB6C2D7),
                                      ))),
                              ProfileElement(
                                  prefixIcon: Icon(
                                    Icons.payment_sharp,
                                    color: AppColors.primaryColor,
                                  ),
                                  title: "Payroll & Tax",
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        size: 30,
                                        color: const Color(0xffB6C2D7),
                                      ))),
                              ProfileElement(
                                  prefixIcon: Icon(
                                    Icons.cake,
                                    color: AppColors.primaryColor,
                                  ),
                                  title: "Roles",
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        size: 30,
                                        color: const Color(0xffB6C2D7),
                                      ))),
                            ],
                          ),

                          const SizedBox(
                            height: 30,
                          ),

                          //profile information

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "SETTINGS",
                                style: TextStyle(
                                    color: const Color(0xff344054),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          ListContainer(children: [
                            ProfileElement(
                                prefixIcon: Icon(
                                  Icons.settings,
                                  color: AppColors.primaryColor,
                                ),
                                title: "Change Password",
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      size: 30,
                                      color: const Color(0xffB6C2D7),
                                    ))),
                            ProfileElement(
                                prefixIcon: Icon(
                                  Icons.code,
                                  color: AppColors.primaryColor,
                                ),
                                title: "Versioning",
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      size: 30,
                                      color: const Color(0xffB6C2D7),
                                    ))),
                            ProfileElement(
                                prefixIcon: Icon(
                                  Icons.file_present,
                                  color: AppColors.primaryColor,
                                ),
                                title: "FAQ and Help",
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      size: 30,
                                      color: const Color(0xffB6C2D7),
                                    ))),
                            ProfileElement(
                                prefixIcon: Icon(
                                  Icons.logout_rounded,
                                  color: const Color(0xffF14E4E),
                                ),
                                title: "Logout",
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      size: 30,
                                      color: const Color(0xffB6C2D7),
                                    ))),
                          ]),

                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Profile picture
          Align(
            alignment: const Alignment(0, -0.8),
            child: CenteredContainer(
              width: 140,
              height: 140,
              bgColor: const Color.fromARGB(255, 244, 244, 244),
              borderRadius: 20,
              child: Image.asset(
                AppImages.profile_2,
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
