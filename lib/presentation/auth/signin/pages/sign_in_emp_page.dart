import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/common/sizedbox/custom_sized_box.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_state.dart';
import 'package:workmate/presentation/auth/signin/widgets/custom_icon_button.dart';
import 'package:workmate/presentation/auth/signin/widgets/label_textfield.dart';
import 'package:workmate/application/services/navigation_service.dart';
import 'package:workmate/application/validators/signup_validators.dart';
import 'package:workmate/presentation/auth/signin/widgets/remember_me_forgot_password.dart';

class SignInEmpPage extends StatefulWidget {
  const SignInEmpPage({super.key});

  @override
  State<SignInEmpPage> createState() => _SignInEmpPageState();
}

class _SignInEmpPageState extends State<SignInEmpPage> {
  bool isSelected = false;

  TextEditingController empIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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

          //email
          LabelTextfield(
            inputType: "number",
            label: "Employee ID",
            hintText: "My Employee ID",
            prefixIcon: Icons.person,
            suffixIcon: Icons.visibility_outlined,
            textController: empIDController,
            validator: (value) =>
                SignupValidators.validateCompanyId(context, value),
          ),

          const CustomSizedBox(
            height: 40,
          ),
          //password

          LabelTextfield(
            inputType: "password",
            obscureText: true,
            label: "Password",
            hintText: "My Password",
            prefixIcon: Icons.document_scanner,
            suffixIcon: Icons.visibility_outlined,
            textController: passwordController,
            validator: (value) =>
                SignupValidators.validatePassword(context, value),
          ),

          // remember me
          RememberMeForgotPassword(forgotPassword: (){}),

          const CustomSizedBox(
            height: 20,
          ),

          // sign in
          CustomButton(
            title: Text(
              'Sign In',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () => NavigationService.navigateHome(context),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
          ),

         const CustomSizedBox(
            height: 40,
          ),

          //divider

          _divider(),

          const CustomSizedBox(
            height: 40,
          ),

          //sign in buttons

          CustomIconButton(
            title: "Sign in With Email",
            icon: Icon(
              Icons.mail,
              color: const Color(0xff6938EF),
            ),
            onTap: () => NavigationService.navigateSignin(context),
          ),

          const CustomSizedBox(
            height: 15,
          ),

          CustomIconButton(
            title: "Sign in With Phone",
            icon: Icon(Icons.phone, color: const Color(0xff6938EF)),
            onTap: () => NavigationService.navigatePhoneSignin(context),
          ),

          const CustomSizedBox(
            height: 20,
          ),

          // sign up

          _signup(context),
          const CustomSizedBox(
            height: 30,
          )
        ],
      ),
    )

        //

        );
  }
}




Widget _divider(){
  return Padding(
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
          );
}

Widget _signup(BuildContext context){
  return Row(
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
                          ..onTap =
                              () => NavigationService.navigateSignUp(context))
                  ]))
            ],
          );
}
