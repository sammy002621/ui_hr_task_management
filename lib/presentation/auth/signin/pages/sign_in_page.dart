import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_state.dart';
import 'package:workmate/presentation/auth/signin/widgets/custom_icon_button.dart';
import 'package:workmate/presentation/auth/signin/widgets/custom_modal_sheet.dart';
import 'package:workmate/presentation/auth/signin/widgets/label_textfield.dart';
import 'package:workmate/presentation/auth/signup/pages/sign_up_page.dart';
import 'package:workmate/services/navigation_service.dart';
import 'package:workmate/validators/signup_validators.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();



  void forgotPassword() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return CustomModalSheet(
              title: "Forgot Password",
              description: RichText(
                  text: TextSpan(
                text:
                    "A verification code will be sent to your email to reset your password.",
                style: TextStyle(
                    color: const Color(0xff344054),
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              )),
              content: Column(
                children: [
                  // email

                  LabelTextfield(
                    label: "Email",
                    hintText: "My email",
                    prefixIcon: Icons.mail,
                    textController: emailController,
                    validator: SignupValidators.validateEmail,
                    onChanged: (value) => SignupValidators.validateForm(context,_formKey),
                  )
                ],
              ),
              button1: CustomButton(
                  title: "Send Verification Code",
                  onTap: forgotPassword2,
                  width: 340,
                  height: 60,
                  color: AppColors.primaryColor,
                  ),
              isTextOrButton: false,
              iconPath: AppVectors.forgotPassword,
              belowTextFieldHeight: 10,
              otpHeight: 10,
              belowButton1height: 5,
              belowTextOrButtonHeight: 5,
              topPosition: -50,
              );
        });
  }

  void forgotPassword2() {
    Navigator.pop(context);
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return CustomModalSheet(
              title: "Forgot Password",
              description: RichText(
                  text: TextSpan(
                      text: "A reset code has been sent to ",
                      style: TextStyle(
                          color: const Color(0xff393B41),
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                    TextSpan(
                      text: "Tonald@work.com ",
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
                      text: "check your email to continue the  process.",
                      style: TextStyle(
                        color: const Color(0xff393B41),
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
                          text: "Haven't received the  code? ",
                          style: TextStyle(
                              color: const Color(0xff263238),
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                        TextSpan(
                            text: "Resend it.",
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
                  onTap: forgotPassword3,
                  width: 340,
                  height: 60,
                  color: AppColors.primaryColor,
                  ),
              isTextOrButton: false,
              iconPath: AppVectors.forgotPassword,
              belowTextFieldHeight: 20,
              belowButton1height: 5,
              belowTextOrButtonHeight: 5,
              );
        });
  }

  void forgotPassword3() {
    Navigator.pop(context);
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return CustomModalSheet(
            title: "Set a New Password",
            description: RichText(
                text: TextSpan(
              text:
                  "Please set a new password to secure your Work Mate account. ",
              style: TextStyle(
                  color: const Color(0xff393B41),
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            )),
            content: Column(
              children: [
                // email

                LabelTextfield(
                  label: "Password",
                  hintText: "Input Password",
                  prefixIcon: Icons.document_scanner,
                  suffixIcon: Icons.visibility_outlined,
                  textController:passwordController,
                  validator: SignupValidators.validatePassword,
                    onChanged: (value) => SignupValidators.validateForm(context,_formKey),
                ),

                const SizedBox(
                  height: 20,
                ),

                LabelTextfield(
                  label: "Confirm Password",
                  hintText: "Re Enter Your Password",
                  prefixIcon: Icons.document_scanner,
                  suffixIcon: Icons.visibility_outlined,
                  textController: passwordController,
                  validator: SignupValidators.validatePassword,
                    onChanged: (value) => SignupValidators.validateForm(context,_formKey),
                )
              ],
            ),
            button1: CustomButton(
                title: "Submit",
                onTap: forgotPassword4,
                width: 340,
                height: 60,
                color: AppColors.primaryColor,
                ),
            isTextOrButton: false,
            belowTextFieldHeight: 0,
            otpHeight: 25,
            iconPath: AppVectors.forgotPassword,
            belowButton1height: 5,
            belowTextOrButtonHeight: 5,
          );
        });
  }

  void forgotPassword4() {
    Navigator.pop(context);
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return CustomModalSheet(
            title: "Password Has Been Created",
            description: RichText(
                text: TextSpan(
              text:
                  "To log in to your account, click the Sign in button and enter your email along with your new password. ",
              style: TextStyle(
                  color: const Color(0xff393B41),
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            )),
            button1: CustomButton(
                title: "Sign in", 
                onTap: () => NavigationService.navigateHome(context), 
                width: 340, 
                height: 60,
                color: AppColors.primaryColor,
                ),
            isTextOrButton: false,
            belowTextFieldHeight: 0,
            descriptionHeight: 5,
            otpHeight: 25,
            iconPath: AppVectors.forgotPassword,
            belowButton1height: 5,
            belowTextOrButtonHeight: 5,
            topPosition: -5,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
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
          const SizedBox(
            height: 5,
          ),
          SizedBox(
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

          const SizedBox(
            height: 35,
          ),

          //email
          LabelTextfield(
            inputType: "email",
            label: "Email",
            hintText: "My Email",
            prefixIcon: Icons.mail,
            textController: emailController,
            validator: SignupValidators.validatePassword,
                    onChanged: (value) => SignupValidators.validateForm(context,_formKey),
          ),

          const SizedBox(
            height: 25,
          ),
          //password

          LabelTextfield(
            inputType: "password",
            obscureText: true,
            label: "Password",
            hintText: "My Password",
            prefixIcon: Icons.document_scanner,
            suffixIcon: Icons.visibility_off_outlined,
            textController: passwordController,
            validator: SignupValidators.validatePassword,
                    onChanged: (value) => SignupValidators.validateForm(context,_formKey),
          ),

          // remember me

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
// remember me
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BlocBuilder<SignupCubit,SignupState>(
                      builder: (context,state){
                      return Checkbox(
                      value: state.isSelected,
                      onChanged: (value) => context.read<SignupCubit>().updateIsSelected(),
                      checkColor: AppColors.primaryColor,
                      activeColor: const Color.fromARGB(255, 214, 213, 213),
                      side:
                          BorderSide(color: AppColors.primaryColor, width: 2.0),
                    );
                    }),
                    Text(
                      "Remember Me",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    )
                  ],
                ),

// forgot password
                TextButton(
                    onPressed: forgotPassword,
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          // sign in
          CustomButton(
            title: "Sign In",
            onTap:() => NavigationService.navigateHome(context),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
            color: AppColors.primaryColor,
          ),

          const SizedBox(
            height: 40,
          ),

          //divider

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: const Color(0xffD0D5DD), // Divider color
                    // Divider thickness
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "OR",
                    style: TextStyle(
                      color: Colors.grey, // Text color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: const Color(0xffD0D5DD), // Divider color
                    thickness: 1, // Divider thickness
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 40,
          ),

          //sign in buttons

          CustomIconButton(
            title: "Sign in With Employee ID",
            icon: Icon(
              Icons.person,
              color: const Color(0xff6938EF),
            ),
            onTap: () => NavigationService.navigateEmployeeSignin(context),
          ),

          const SizedBox(
            height: 15,
          ),

          CustomIconButton(
            title: "Sign in With Phone",
            icon: Icon(Icons.phone, color: const Color(0xff6938EF)),
            onTap: () => NavigationService.navigatePhoneSignin(context),
          ),

          const SizedBox(
            height: 20,
          ),

          // sign up

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                      text: "Don’t have an account? ",
                      style: TextStyle(
                          color: const Color(0xff263238),
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                    TextSpan(
                        text: "Sign Up Here",
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

          const SizedBox(height: 30,)
        ],
      ),
    )

        //

        );
  }
}
