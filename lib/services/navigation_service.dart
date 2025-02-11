import 'package:flutter/material.dart';
import 'package:workmate/presentation/auth/signin/pages/sign_in_page.dart';
import 'package:workmate/presentation/home/pages/main_home_screen.dart';
import 'package:workmate/presentation/profile/pages/profile_page.dart';

// class to hand the navigation logic
class NavigationService {
  static void navigateHome(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MainHomeScreen()));
  }

  static void navigateProfile(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ProfilePage()));
  }

  static void navigateSignin(BuildContext context) {
    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
  }
}
