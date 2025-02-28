import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/common/button/custom_button.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_state.dart';
import 'package:workmate/presentation/auth/signin/widgets/custom_icon_button.dart';
import 'package:workmate/presentation/auth/signin/widgets/label_textfield.dart';
import 'package:workmate/services/navigation_service.dart';
import 'package:workmate/validators/signup_validators.dart';

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
              inputType: "number",
              label: "Employee ID",
              hintText: "My Employee ID",
              prefixIcon:
                Icons.person,
          
              suffixIcon:
                Icons.visibility_outlined,
              textController: empIDController,
              validator: (value) => SignupValidators.validateCompanyId(context, value),
              
              ),

          const SizedBox(
            height: 40,
          ),
          //password

          LabelTextfield(
            inputType: "password",
            obscureText: true,
            label: "Password",
            hintText: "My Password",
            prefixIcon: Icons.document_scanner,
            suffixIcon:
              Icons.visibility_outlined,
            textController: passwordController,
            validator: (value) => SignupValidators.validatePassword(context, value),
            
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
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),

// forgot password
//NOTE: implement the forgot password logic 
                TextButton(
                    onPressed: (){},
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 18,
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
            title:Text(
              'Sign In',
              style: TextStyle(
                fontSize:  20,
                color:  Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ), 
            onTap: () => NavigationService.navigateHome(context),
            width: MediaQuery.of(context).size.width * 0.9, 
            height: 60,),

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
              title: "Sign in With Email",
              icon: Icon(
                Icons.mail,
                color: const Color(0xff6938EF),
              ),
              onTap: () => NavigationService.navigateSignin(context),
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
                          ..onTap = () => NavigationService.navigateSignUp(context))
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
