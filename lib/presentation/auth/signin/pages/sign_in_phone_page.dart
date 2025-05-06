import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/common/sizedbox/custom_sized_box.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_state.dart';
import 'package:workmate/presentation/auth/signin/widgets/custom_divider.dart';
import 'package:workmate/presentation/auth/signin/widgets/custom_icon_button.dart';
import 'package:workmate/presentation/auth/signin/widgets/custom_modal_sheet.dart';
import 'package:workmate/presentation/auth/signin/widgets/custom_signup.dart';
import 'package:workmate/presentation/auth/signin/widgets/phone_label_textfield.dart';
import 'package:workmate/presentation/auth/signin/widgets/remember_me_forgot_password.dart';
import 'package:workmate/presentation/auth/signup/pages/sign_up_page.dart';
import 'package:workmate/application/services/navigation_service.dart';
import 'package:workmate/application/validators/signup_validators.dart';

class SignInPhonePage extends StatefulWidget {
  const SignInPhonePage({super.key});

  @override
  State<SignInPhonePage> createState() => _SignInPhonePageState();
}

class _SignInPhonePageState extends State<SignInPhonePage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _navigatePhoneSignin() {
     showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return CustomModalSheet(
          title: "Sign In Phone Number", 
          isTextOrButton: true,
          description: RichText(
            
                  text: TextSpan(
                      text: "Sign in code sent to ",
                      style: TextStyle(
                          color: const Color(0xff263238),
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                    TextSpan(
                      text: "+6292121002200",
                      style: TextStyle(
                        color: AppColors.descriptionColor,
                      ),
                    ),
                    TextSpan(
                      text: ",",
                      style: TextStyle(
                        color: AppColors.descriptionColor,
                      ),

                      
                    ),




                    TextSpan(
                  text:"check your inbox to continue the process",
                  style: TextStyle(
                      color: const Color(0xff263238),
                      fontSize: 17,
                      fontWeight: FontWeight.w500))
                  ])),

                  descriptionHeight: 16,
          content:OtpTextField(
                decoration:InputDecoration(
                  hintStyle: TextStyle(
                    color: const Color(0xffEAECF0)
                  )
                ),
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
              button1: CustomButton(
                title:Text(
              'Submit',
              style: TextStyle(
                fontSize:  20,
                color:  Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
                onTap: () => NavigationService.navigateHome(context),
               width: MediaQuery.of(context).size.width * 0.9,
                height: 60,
                color: AppColors.primaryColor,
                ),
              belowTextField: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Sign In with different method ",
                          style: TextStyle(
                              color: const Color(0xff263238),
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                        TextSpan(
                            text: "Here",
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
              belowTextFieldHeight: 15,
              messageText: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Sign In with different method ",
                          style: TextStyle(
                              color: const Color(0xff263238),
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                        TextSpan(
                            text: "Here",
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
              belowButton1height: 10,
              iconPath: AppVectors.centered_phone_icon,
              belowTextOrButtonHeight: 10,
              
              );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const CustomSizedBox(
            height: 30,
          ),
          // header 1
          Text(
            "Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.headerColor,
                fontSize: 30,
                fontWeight: FontWeight.w700),
          ),

          //description 1
          const CustomSizedBox(
            height: 5,
          ),
          CustomSizedBox(
            width: 350,
            child: Text(
              "Sign in to my account",
              style: TextStyle(
                color: AppColors.descriptionColor,
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const CustomSizedBox(
            height: 35,
          ),

          const CustomSizedBox(
            height: 10,
          ),
          //password

          PhoneLabelTextfield(label: 'Phone Number',controller:phoneController,),

          // remember me

          RememberMeForgotPassword(forgotPassword: (){}),

          const CustomSizedBox(
            height: 20,
          ),

          // sign in
          CustomButton(
            title:Text(
              'Sign In',
              style: TextStyle(
                fontSize:  20,
                color:  Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: _navigatePhoneSignin,
            width:MediaQuery.of(context).size.width * 0.9,
            height: 60,
            color: AppColors.primaryColor,
          ),

          const SizedBox(
            height: 40,
          ),

          //divider

         CustomDivider(),    

          const CustomSizedBox(
            height: 40,
          ),

          //sign in buttons

          CustomIconButton(
            title: "Sign in With Employee ID",
            icon: Icon(
              Icons.person,
              color: const Color(0xff6938EF),
            ),
            onTap:() => NavigationService.navigateEmployeeSignin(context),
          ),

          const CustomSizedBox(
            height: 15,
          ),

          CustomIconButton(
            title: "Sign in With Email",
            icon: Icon(Icons.phone, color: const Color(0xff6938EF)),
            onTap:() => NavigationService.navigateSignin(context),
          ),

          const CustomSizedBox(
            height: 30,
          ),

          // sign up

          CustomSignup(),

          const CustomSizedBox(
            height: 15,
          )
        ],
      ),
    ));
  }
}
