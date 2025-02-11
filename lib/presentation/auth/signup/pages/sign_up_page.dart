import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/presentation/auth/signup/bloc/text_form_cubit.dart';
import 'package:workmate/presentation/auth/signup/bloc/text_form_state.dart';
import 'package:workmate/services/navigation_service.dart';
import 'package:workmate/validators/signup_validators.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signin/bloc/phone_number_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_state.dart';
import 'package:workmate/presentation/auth/signin/widgets/custom_modal_sheet.dart';
import 'package:workmate/presentation/auth/signin/widgets/label_textfield.dart';
import 'package:workmate/presentation/auth/signin/widgets/phone_label_textfield.dart';
import 'package:http/http.dart' as http;

// TODO: carefully read and understand the different layers of  clean architecture and how they should work

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
                        text: "Haven't Received the  code?  ",
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
                    validator: SignupValidators.validateEmail,
                    onChanged: (value) => SignupValidators.validateForm(context,_formKey),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  // phone number
                  PhoneLabelTextfield(
                    label: 'Phone Number',
                    controller: phoneController,
                    onChanged: (phone) => SignupValidators.validateForm(context, _formKey),
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
                    validator: SignupValidators.validateCompanyId,
                    onChanged: (value) => SignupValidators.validateForm(context,_formKey),
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
                          validator: SignupValidators.validatePassword,
                          onChanged: (value) => SignupValidators.validateForm(context,_formKey),
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
                          validator: SignupValidators.validateConfirmPassword(
                              passwordController.text),
                          onChanged: (value) => SignupValidators.validateForm(context,_formKey),
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

          BlocBuilder<TextFormCubit,TextFormState>(
            builder: (context,state){
            return Padding(
            padding: const EdgeInsets.all(5),
            child: CustomButton(
              title: "Sign Up",
              onTap: state.isFormValid ? navigateWelcome : (){},
              width: 20,
              height: 60,
              color: state.isFormValid ? AppColors.primaryColor : AppColors.primaryColor.withAlpha(128),
            ),
          );
          }),

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
                          ..onTap = () => NavigationService.navigateSignin(context))
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
