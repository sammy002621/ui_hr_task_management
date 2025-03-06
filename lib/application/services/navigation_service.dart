import 'package:flutter/material.dart';
import 'package:workmate/presentation/auth/signin/pages/sign_in_emp_page.dart';
import 'package:workmate/presentation/auth/signin/pages/sign_in_page.dart';
import 'package:workmate/presentation/auth/signin/pages/sign_in_phone_page.dart';
import 'package:workmate/presentation/auth/signup/pages/sign_up_page.dart';
import 'package:workmate/presentation/home/pages/main_home_screen.dart';
import 'package:workmate/presentation/profile/pages/profile_page.dart';

// class to handle the page navigation logic
class NavigationService {
  // method to navigate to the home page
  static void navigateHome(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MainHomeScreen()));
  }
 // method to navigate to the profile page
  static void navigateProfile(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ProfilePage()));
  }

  // method to navigate to the sign-in page
  static void navigateSignin(BuildContext context) {
    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
  }

 // method to navigate to the sign-in-phone page
static void navigatePhoneSignin(BuildContext context) {
    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPhonePage()));
  }

// method to navigate to the sign-in-emp page
static void navigateEmployeeSignin(BuildContext context) {
    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInEmpPage()));
  }

// method to navigate to the sign-up page
  static void navigateSignUp(BuildContext context) {
    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
  }
  
}
