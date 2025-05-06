import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/common/sizedbox/custom_sized_box.dart';
import 'package:workmate/core/configs/utils/LoggerImpl.dart';
import 'package:workmate/data/models/create_user.dart';
import 'package:workmate/domain/usecases/auth/send_otp_usecase.dart';
import 'package:workmate/domain/usecases/auth/sign_up_usecase.dart';
import 'package:workmate/presentation/auth/signup/bloc/text_form_cubit.dart';
import 'package:workmate/presentation/auth/signup/bloc/text_form_state.dart';
import 'package:workmate/presentation/auth/signup/bloc/user_cubit.dart';
import 'package:workmate/service_locator.dart';
import 'package:workmate/application/services/navigation_service.dart';
import 'package:workmate/application/validators/signup_validators.dart';
import 'package:workmate/core/configs/assets/app_vectors.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signin/bloc/phone_number_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_state.dart';
import 'package:workmate/presentation/auth/signin/widgets/custom_modal_sheet.dart';
import 'package:workmate/presentation/auth/signin/widgets/label_textfield.dart';
import 'package:workmate/presentation/auth/signin/widgets/phone_label_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController compIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const CustomSizedBox(
            height: 30,
          ),
          // logo

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset(AppVectors.workmate_logo)],
          ),

          const CustomSizedBox(
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

          const CustomSizedBox(
            height: 3,
          ),

          // description
          CustomSizedBox(
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

          const CustomSizedBox(
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
                    validator: (value) =>
                        SignupValidators.validateEmail(context, value),
                  ),

                  const CustomSizedBox(
                    height: 25,
                  ),
                  // phone number
                  PhoneLabelTextfield(
                    label: 'Phone Number',
                    controller: phoneController,
                  ),

                  const CustomSizedBox(
                    height: 10,
                  ),

                  // company id
                  LabelTextfield(
                    label: "Company ID",
                    hintText: "COMP-9F26HC",
                    prefixIcon: Icons.shopping_bag,
                    textController: compIDController,
                    validator: (value) =>
                        SignupValidators.validateCompanyId(context, value),
                  ),

                  const CustomSizedBox(
                    height: 25,
                  ),

                  // password
                  _password(passwordController, confirmPasswordController),
                  // agree to terms and conditions
                ],
              )),
          Row(
            children: [
              // checkbox
              _checkBox(),
              // rich text
              _termsAndConditions(),
            ],
          ),

          const CustomSizedBox(
            height: 30,
          ),
          // sign up button
          _signup(emailController),
          const CustomSizedBox(
            height: 30,
          ),
          // sign in
          _alreadyHaveAccount(context),
          const CustomSizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}



void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
    duration: Duration(seconds: 5),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Widget _termsAndConditions() {
  return Expanded(
      child: RichText(
          text: TextSpan(
              text: "I agree with ",
              style: TextStyle(color: Colors.black, fontSize: 17),
              children: <TextSpan>[
        TextSpan(
          text: "terms & conditions ",
          style: TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.w500),
        ),
        TextSpan(text: "and ", style: TextStyle(color: Colors.black)),
        TextSpan(
            text: "privacy policy",
            style: TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.w500))
      ])));
}

Widget _alreadyHaveAccount(BuildContext context) {
  return Row(
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
  );
}


Widget _signup(TextEditingController emailController) {
 return  BlocBuilder<TextFormCubit, TextFormState>(builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: CustomButton(
        title: state.isSubmitting
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
            : Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
        // on tap we should start submitting
        onTap: !state.isFormValid
            ? () {
                AppLogger.instance.i("NULL CLICKED :");
              }
            : () async {
                AppLogger.instance.i("SIGNUP CLICKED:");
                // first send the otp to the passed email address
                context.read<TextFormCubit>().startSubmitting();
                var response = await sl<SendOtpUsecase>()
                    .call(params: emailController.text);
                response.fold((isLeft) {
                  AppLogger.instance.e('$isLeft');
                }, (success) {
                  AppLogger.instance.i('$success');
                  context.read<TextFormCubit>().submissionComplete();
                });
                
                //927258
              },
        width: 20,
        height: 60,
        color: state.isFormValid
            ? AppColors.primaryColor
            : AppColors.primaryColor.withAlpha(100),
      ),
    );
  });
}


Widget _checkBox(){
  return BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
                return Checkbox(
                  value: state.isSelected,
                  onChanged: (value) =>
                      context.read<SignupCubit>().updateIsSelected(),
                  checkColor: AppColors.primaryColor,
                  activeColor: const Color.fromARGB(255, 214, 213, 213),
                  side: BorderSide(color: AppColors.primaryColor, width: 2.0),
                );
              });
}


Widget _password(TextEditingController passwordController,TextEditingController confirmPasswordController,){
  return BlocBuilder<SignupCubit, SignupState>(
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
                          validator: (value) =>
                              SignupValidators.validatePassword(context, value),
                        ),

                        const CustomSizedBox(
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
                          validator: (value) =>
                              SignupValidators.validateConfirmPassword(
                                  context, passwordController.text, value),
                        ),

                        const CustomSizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  });
}

void _navigatePhoneSignup(
  BuildContext context ,String email,TextEditingController emailController,TextEditingController compIDController,TextEditingController passwordController,TextEditingController phoneController,TextEditingController confirmPasswordController) async {
    context.read<TextFormCubit>().submissionComplete();
    String otp = '';
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
                  // load the email from the user state
                  TextSpan(
                    text: email,
                    style: TextStyle(
                      color: AppColors.descriptionColor,
                    ),
                  ),
                  TextSpan(
                    text: " for your account verification process.",
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
              onSubmit: (String verificationCode) {
                AppLogger.instance.i("VERIFICATION CODE: $verificationCode");
                // call the method to send the otp
                try {
                  otp = verificationCode;
                  AppLogger.instance.i("Value of otp is : $otp");
                } catch (e) {
                  AppLogger.instance.e('ERROR OCCURRED: $e');
                  String errorMessage = e is Map
                      ? (e['message'] ?? 'Unknown error')
                      : e.toString();
                  showSnackBar(context, errorMessage);
                  context.read<TextFormCubit>().setError(errorMessage);
                }
              }, // end onSubmit
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
            button1: BlocBuilder<TextFormCubit, TextFormState>(
                builder: (context, state) {
              return CustomButton(
                title: state.isSubmitting
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                    : Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                onTap: () => signUpUser(context, otp,emailController,compIDController,passwordController,phoneController,confirmPasswordController),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 60,
                color: AppColors.primaryColor,
              );
            }),
            isTextOrButton: true,
            iconPath: AppVectors.centered_mail_icon,
            belowTextFieldHeight: 20,
            belowButton1height: 5,
            belowTextOrButtonHeight: 5,
            topPosition: -10,
          );
        });
  }


  void navigateWelcome(BuildContext context, TextEditingController emailController,TextEditingController compIDController,TextEditingController passwordController,TextEditingController phoneController,TextEditingController confirmPasswordController) {
    Navigator.pop(context);
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: false, // Prevent dismissing by tapping outside
        enableDrag: false, // Prevent dragging
        builder: (context) {
          return CustomModalSheet(
            title: "Welcome To Work Mate!",
            description: RichText(
                text: TextSpan(
              text:
                  "To enhance your user experience, please set up your profile first. This will help us tailor the app to your needs and ensure you get the most out of our features!",
              style: TextStyle(
                  color: const Color(0xff344054),
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            )),
            button1: CustomButton(
              title: Text(
                'Set Up my Profile',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                emailController.clear();
                phoneController.clear();
                compIDController.clear();
                passwordController.clear();
                confirmPasswordController.clear();
                NavigationService.navigateProfile(context);
              },
              width: MediaQuery.of(context).size.width * 0.9,
              height: 60,
              color: AppColors.primaryColor,
            ),
            button2: CustomButton(
              title: Text(
                'Explore The App First',
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xff6938EF),
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                emailController.clear();
                phoneController.clear();
                compIDController.clear();
                passwordController.clear();
                confirmPasswordController.clear();
                NavigationService.navigateHome(context);
              },
              width: MediaQuery.of(context).size.width * 0.9,
              height: 60,
              color: Colors.white,
              textColor: AppColors.primaryColor,
              borderColor: AppColors.primaryColor,
            ),
            isTextOrButton: false,
            descriptionHeight: 0,
            otpHeight: 0,
            iconPath: AppVectors.centered_profile_icon,
            belowTextOrButtonHeight: 10,
            belowTextFieldHeight: 20,
            topPosition: 0,
          );
        });
  }



  void signUpUser(BuildContext context, String otp,TextEditingController emailController,TextEditingController compIDController,TextEditingController passwordController,TextEditingController phoneController,TextEditingController confirmPasswordController) async {
    AppLogger.instance.i("Received otp from upper function : $otp");
    try {
      final createUser = CreateUser(
        email: emailController.text,
        phone: getCompleteNumber(context , phoneController.text),
        compID: compIDController.text,
        password: passwordController.text,
        otp: otp,
      );
      context.read<TextFormCubit>().startSubmitting();
      final response = await sl<SignUpUsecase>().call(params: createUser);
      response.fold((error) {
        AppLogger.instance.e('ERROR OCCURRED: $error');
        String errorMessage = error is Map
            ? (error['message'] ?? 'Unknown error')
            : error.toString();
        showSnackBar(context, errorMessage);
        context.read<TextFormCubit>().setError(errorMessage);
      }, (success) {
        try {
          // Detailed debugging information
          AppLogger.instance.i('Raw Response: $success');
          AppLogger.instance.i('Response Type: ${success.runtimeType}');

          // Handle different response types
          Map<String, dynamic> responseData;

          if (success is String) {
            // Check for common issues with string responses
            if (success.isEmpty) {
              AppLogger.instance.i('Empty string response');
              throw FormatException('Empty response from server');
            }

            // Try cleaning the string before parsing
            String cleanedString = success.trim();

            // Remove BOM character if present
            if (cleanedString.startsWith('\uFEFF')) {
              cleanedString = cleanedString.substring(1);
              AppLogger.instance.i('BOM character detected and removed');
            }

            try {
              responseData = json.decode(cleanedString);
              AppLogger.instance.i('Successfully parsed JSON after cleaning');
            } catch (parseError) {
              AppLogger.instance.e('First parsing attempt failed: $parseError');

              // Try a second approach - if there might be double encoding
              try {
                // In case of double encoding
                var intermediateResult = json.decode(cleanedString);
                if (intermediateResult is String) {
                  responseData = json.decode(intermediateResult);
                  AppLogger.instance
                      .i('Successfully parsed double-encoded JSON');
                } else {
                  throw FormatException('Unexpected intermediate format');
                }
              } catch (secondError) {
                AppLogger.instance
                    .e('Second parsing attempt failed: $secondError');
                throw FormatException('Failed to parse JSON: $parseError');
              }
            }
          } else if (success is Map<String, dynamic>) {
            // Already a map, use directly
            responseData = success;
            AppLogger.instance
                .i('Response was already a Map, no parsing needed');
          } else {
            // Unexpected type
            throw FormatException(
                'Unexpected response type: ${success.runtimeType}');
          }

          // Validate the response structure
          AppLogger.instance
              .i('Response data keys: ${responseData.keys.toList()}');
          if (!responseData.containsKey('user') ||
              !responseData.containsKey('token')) {
            AppLogger.instance.i(
                'Missing expected keys in response. Available keys: ${responseData.keys.toList()}');
            throw FormatException(
                'Invalid response format - missing required fields');
          }

          // Extract and print user information for debugging
          final user = responseData['user'];
          AppLogger.instance.i('User data: $user');
          AppLogger.instance.i('User data type: ${user.runtimeType}');

          // Extract required fields
          final String email = user['email'];
          final String id = user['_id'];
          final String token = responseData['token'];

          AppLogger.instance.i(
              'Successfully extracted user data - Email: $email, ID: $id, Token: ${token.substring(0, min(10, token.length))}...');

          // Save user information
          context.read<UserCubit>().setUser(id, email, token);
          context.read<TextFormCubit>().submissionComplete();

          navigateWelcome(context ,emailController,compIDController,passwordController,phoneController,confirmPasswordController);
        } catch (e) {
          AppLogger.instance.i('ERROR PROCESSING RESPONSE: $e');
          String errorMessage =
              'Failed to process server response: ${e.toString()}';
          showSnackBar(context, errorMessage);
          context.read<TextFormCubit>().setError(errorMessage);
        }
      });
    } on SocketException catch (e) {
      AppLogger.instance.e('NETWORK ERROR: $e');
      String errorMessage =
          'Network error occurred. Please check your connection.';
      showSnackBar(context, errorMessage);
      context.read<TextFormCubit>().setError(errorMessage);
    } catch (e) {
      AppLogger.instance.e('UNEXPECTED ERROR: $e');
      String errorMessage = 'An unexpected error occurred: ${e.toString()}';
      showSnackBar(context, errorMessage);
      context.read<TextFormCubit>().setError(errorMessage);
    }
  }




  String getCompleteNumber(BuildContext context ,String typedNumber) {
    var completeNumber =
        '+${context.read<PhoneNumberCubit>().state.dialCode}$typedNumber';
    AppLogger.instance.i('THE COMPLETE NUMBER IS : $completeNumber');
    return completeNumber;
  }
