import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_state.dart';
import 'package:workmate/presentation/auth/signin/pages/sign_in_page.dart';
import 'package:workmate/presentation/auth/signin/widgets/custom_modal_sheet.dart';
import 'package:workmate/presentation/auth/signin/widgets/label_textfield.dart';
import 'package:workmate/presentation/home/pages/home_page.dart';
import 'package:workmate/presentation/home/pages/main_home_screen.dart';
import 'package:workmate/presentation/onboarding/widgets/next_button.dart';
import 'package:workmate/presentation/profile/pages/profile_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isSelected = false;


  void _navigateHome(){
     Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MainHomeScreen()));
  }

   void _navigateProfile(){
     Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ProfilePage()));
  }


 



  void navigateWelcome(){
  Navigator.pop(context);
showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return CustomModalSheet(
              title: "Welcome To Work Mate!",
              description: RichText(
                  text: TextSpan(
                      text: "To enhance your user experience, please set up your profile first. This will help us tailor the app to your needs and ensure you get the most out of our features!",
                      style: TextStyle(
                          color: const Color(0xff344054),
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                      )),


              button1: CustomButton(
                title: "Set Up My Profile",
                onTap: _navigateProfile,
                width: MediaQuery.of(context).size.width * 0.9, 
                height: 60,
                color: AppColors.primaryColor,
                ),
              
              button2: CustomButton(
                title: "Explore The App First",
                onTap: _navigateHome, 
                width: MediaQuery.of(context).size.width * 0.9, 
                height:60,
                color:Colors.white,
                textColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
                ),
              isTextorButton: false,
              descriptionheight: 0,
              otpheight: 0,
              iconPath: AppVectors.centered_profile_icon,
              belowTextOrButtonheight: 10,
              belowTextFieldheight: 20,
              topPosition: -50,
              );
        });






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
                        color:const Color(0xff263238),
                      ),
                    ),
                  ])),

                  content: OtpTextField(
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

              belowTextField:Row(
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
                width:MediaQuery.of(context).size.width * 0.9, 
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

          // email
          LabelTextfield(
            label: "Email",
            hintText: "Enter Your Email",
            prefixIcon: Icons.mail,
          ),

          const SizedBox(
            height: 25,
          ),
          // phone number

          LabelTextfield(
            label: "Phone Number",
            hintText: "+62 0000 0000 0000",
            prefixIcon: Icons.keyboard_arrow_down,
          ),

          const SizedBox(
            height: 25,
          ),

          // company id

          LabelTextfield(
            label: "Company ID",
            hintText: "Enter Company ID",
            prefixIcon: Icons.shopping_bag,
          ),

          const SizedBox(
            height: 25,
          ),

          // password

         BlocBuilder<SignupCubit,SignupState>(
          builder: (context,state){
          return Column(
            children: [
               LabelTextfield(
            label: "Password",
            hintText: "My Password",
            prefixIcon: Icons.document_scanner,
            suffixIcon: state.obscure1 ? Icons.visibility_off_outlined : Icons.visibility,
            obscureText: state.obscure1,
            onTap: () {
              context.read<SignupCubit>().updateObscure1();
            },
          ),

          

          const SizedBox(
            height: 25,
          ),
          // confirm password

          LabelTextfield(
            label: "Confirm Password",
            hintText: "My Password",
            prefixIcon: Icons.document_scanner,
            suffixIcon: state.obscure2 ? Icons.visibility_off_outlined : Icons.visibility,
            obscureText: state.obscure2,
            onTap: () {
              context.read<SignupCubit>().updateObscure2();
            },
          ),

          const SizedBox(
            height: 15,
          ),
            ],
          );
         }),
          // agree to terms and conditions

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
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    TextSpan(
                        text: "and ", style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "privacy policy",
                        style: TextStyle(color: AppColors.primaryColor))
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
                onTap: _navigatePhoneSignup,
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

          const SizedBox(height: 30,)
        ],
      ),
    );
  }
}
