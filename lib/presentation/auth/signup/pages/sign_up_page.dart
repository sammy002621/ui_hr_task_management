import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signin/bloc/phone_number_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_state.dart';
import 'package:workmate/presentation/auth/signin/pages/sign_in_page.dart';
import 'package:workmate/presentation/auth/signin/widgets/custom_modal_sheet.dart';
import 'package:workmate/presentation/auth/signin/widgets/label_textfield.dart';
import 'package:workmate/presentation/auth/signin/widgets/phone_label_textfield.dart';
import 'package:workmate/presentation/home/pages/home_page.dart';
import 'package:workmate/presentation/home/pages/main_home_screen.dart';
import 'package:workmate/presentation/onboarding/widgets/next_button.dart';
import 'package:workmate/presentation/profile/pages/profile_page.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isSelected = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController compIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // FUNCTION TO GET THE CURRENT DIAL CODE  and the number itself
  String getCompleteNumber(String typedNumber) {
    var completeNumber =
        '+${context.read<PhoneNumberCubit>().state.dialCode}$typedNumber';
    print(
        'THE COMPLETE NUMBER IS : ____________________________________$completeNumber');
    return completeNumber;
  }


  // function to validate email 

  String? Function(String?)? validateEmail = (String? email) {
  if (email == null || email.isEmpty) return "Please enter valid email";
  final regex = RegExp(r"^[^@]+@[^@]+\.[a-zA-Z]{2,}$");
  return regex.hasMatch(email) ? null : "Please enter valid email";
};


// function to validate company ID

String? Function(String?) validateCompanyId = (String? companyId) {
  if (companyId == null || companyId.isEmpty) {
    return "Company ID is required";
  }
  
  if (!companyId.startsWith("COMP-")) {
    return "ID should start with COMP-";
  }

  // Remove "COMP-" and check if remaining part is exactly 8 characters
  String remainingPart = companyId.substring(5); // 5 is length of "COMP-"
  if (remainingPart.length != 8) {
    return "8 characters required after COMP-";
  }

  return null; // Return null when validation passes
};




// function to validate password 

String? Function(String?) validatePassword = (String? password) {
  if (password == null || password.isEmpty) {
    return "Password required";
  }

  if (password.length < 8) {
    return "Min 8 characters";
  }

  bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  bool hasLowercase = password.contains(RegExp(r'[a-z]'));
  bool hasDigit = password.contains(RegExp(r'[0-9]'));
  bool hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  if (!hasUppercase) {
    return "Add uppercase letter";
  }
  
  if (!hasLowercase) {
    return "Add lowercase letter";
  }

  if (!hasDigit) {
    return "Add a number";
  }

  if (!hasSpecialChar) {
    return "Add special char (!@#\$...)";
  }

  return null;
};


// function to confirm password 

String? Function(String?) validateConfirmPassword(String? password) {
  return (String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Password required";
    }
    
    if (confirmPassword != password) {
      return "Passwords must match";
    }
    
    return null;
  };
}



  void _navigateHome() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const MainHomeScreen()));
  }

  void _navigateProfile() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ProfilePage()));
  }

  void navigateWelcome() async {
    // get the necessary fields and make the api request
    try {
      var url = Uri.http('10.12.74.43:5000', '/api/register');
      var response = await http.post(url, body: {
        'email': emailController.text,
        'phone': getCompleteNumber(phoneController.text),
        'compID': compIDController.text,
        'password': passwordController.text,
      });

      print('RESPONSE IS : $response');
      emailController.clear();
      phoneController.clear();
      compIDController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
    } on SocketException catch (e) {
      // Handle network errors
      print(
          'NETWORK ERROR OCCURED ___________________________________________: $e');
      // Show user-friendly message
    } catch (e) {
      // Handle other types of errors
      print(
          'ERROR OCCURED ____________________________________________________: $e');
    }

    // Navigator.pop(context);
    // showModalBottomSheet(
    //     backgroundColor: Colors.transparent,
    //     context: context,
    //     builder: (context) {
    //       return CustomModalSheet(
    //         title: "Welcome To Work Mate!",
    //         description: RichText(
    //             text: TextSpan(
    //           text:
    //               "To enhance your user experience, please set up your profile first. This will help us tailor the app to your needs and ensure you get the most out of our features!",
    //           style: TextStyle(
    //               color: const Color(0xff344054),
    //               fontSize: 17,
    //               fontWeight: FontWeight.w500),
    //         )),
    //         button1: CustomButton(
    //           title: "Set Up My Profile",
    //           onTap: _navigateProfile,
    //           width: MediaQuery.of(context).size.width * 0.9,
    //           height: 60,
    //           color: AppColors.primaryColor,
    //         ),
    //         button2: CustomButton(
    //           title: "Explore The App First",
    //           onTap: _navigateHome,
    //           width: MediaQuery.of(context).size.width * 0.9,
    //           height: 60,
    //           color: Colors.white,
    //           textColor: AppColors.primaryColor,
    //           borderColor: AppColors.primaryColor,
    //         ),
    //         isTextorButton: false,
    //         descriptionheight: 0,
    //         otpheight: 0,
    //         iconPath: AppVectors.centered_profile_icon,
    //         belowTextOrButtonheight: 10,
    //         belowTextFieldheight: 20,
    //         topPosition: -50,
    //       );
    //     });
  }

  void _navigatePhoneSignup() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return CustomModalSheet(
            title: "Email Verification Sent!",
            description: RichText(
                text: TextSpan(
                    text: "Verification code will be sent to the email  ",
                    style: TextStyle(
                        color: const Color(0xff263238),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                  TextSpan(
                    text: "Hello@work.com ",
                    style: TextStyle(
                      color: AppColors.descriptionColor,
                    ),
                  ),
                  TextSpan(
                    text: "for your account verification process.",
                    style: TextStyle(
                      color: const Color(0xff263238),
                    ),
                  ),
                ])),
            content: OtpTextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: const Color(0xffEAECF0))),
              borderRadius: BorderRadius.circular(15),
              fieldWidth: 48,
              numberOfFields: 6,
              borderColor: Color(0xFFFEFEFE),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {}, // end onSubmit
            ),
            belowTextField: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Havent Received the  code?  ",
                        style: TextStyle(
                            color: const Color(0xff263238),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                      TextSpan(
                          text: "Resend it",
                          style: TextStyle(
                            color: const Color(0xff6938EF),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            })
                    ]))
              ],
            ),
            button1: CustomButton(
              title: "Submit",
              onTap: navigateWelcome,
              width: MediaQuery.of(context).size.width * 0.9,
              height: 60,
              color: AppColors.primaryColor,
            ),
            isTextorButton: true,
            iconPath: AppVectors.centered_mail_icon,
            belowTextFieldheight: 20,
            belowButton1height: 5,
            belowTextOrButtonheight: 5,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          // logo

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset(AppVectors.workmate_logo)],
          ),

          const SizedBox(
            height: 15,
          ),

          // header

          Text(
            "Work Mate",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.headerColor,
                fontSize: 30,
                fontWeight: FontWeight.w700),
          ),

          const SizedBox(
            height: 3,
          ),

          // description

          SizedBox(
            width: 350,
            child: Text(
              "Register Using Your Credentials",
              style: TextStyle(
                color: const Color(0xff393B41),
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          Form(
              key: _formKey,
              child: Column(
                children: [
                  // email
                  LabelTextfield(
                    label: "Email",
                    hintText: "Enter Your Email",
                    prefixIcon: Icons.mail,
                    textController: emailController,
                    validator: validateEmail,
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  // phone number
                  PhoneLabelTextfield(
                    label: 'Phone Number',
                    controller: phoneController,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // company id

                  LabelTextfield(
                    label: "Company ID",
                    hintText: "COMP-9F1A2B3C",
                    prefixIcon: Icons.shopping_bag,
                    textController: compIDController,
                    validator: validateCompanyId,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // password

                  BlocBuilder<SignupCubit, SignupState>(
                      builder: (context, state) {
                    return Column(
                      children: [
                        LabelTextfield(
                          label: "Password",
                          hintText: "My Password",
                          prefixIcon: Icons.document_scanner,
                          suffixIcon: state.obscure1
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                          obscureText: state.obscure1,
                          onTap: () {
                            context.read<SignupCubit>().updateObscure1();
                          },
                          textController: passwordController,
                          validator: validatePassword,
                        ),

                        const SizedBox(
                          height: 25,
                        ),
                        // confirm password

                        LabelTextfield(
                          label: "Confirm Password",
                          hintText: "My Password",
                          prefixIcon: Icons.document_scanner,
                          suffixIcon: state.obscure2
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                          obscureText: state.obscure2,
                          onTap: () {
                            context.read<SignupCubit>().updateObscure2();
                          },
                          textController: confirmPasswordController,
                          validator: validateConfirmPassword(passwordController.text),
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  }),
                  // agree to terms and conditions
                ],
              )),
          Row(
            children: [
              // checkbox
              Checkbox(
                  value: _isSelected,
                  onChanged: (value) {
                    setState(() {
                      _isSelected = value!;
                    });
                  }),

              // rich text

              Expanded(
                  child: RichText(
                      text: TextSpan(
                          text: "I agree with ",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                          children: <TextSpan>[
                    TextSpan(
                      text: "terms & conditions ",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                        text: "and ", style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "privacy policy",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500))
                  ])))
            ],
          ),

          const SizedBox(
            height: 30,
          ),

          // sign up button

          Padding(
            padding: const EdgeInsets.all(5),
            child: CustomButton(
              title: "Sign Up",
              onTap: navigateWelcome,
              width: 20,
              height: 60,
              color: AppColors.primaryColor,
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          // sign in

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                      children: <TextSpan>[
                    TextSpan(
                        text: "Sign in here",
                        style: TextStyle(color: AppColors.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
                          })
                  ]))
            ],
          ),

          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
