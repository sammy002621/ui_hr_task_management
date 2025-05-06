import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:workmate/application/services/navigation_service.dart';

class CustomSignup extends StatelessWidget {
  const CustomSignup({super.key});

  @override
  Widget build(BuildContext context) {
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
                          ..onTap = () => NavigationService.navigateSignUp(context))
                  ]))
            ],
          );
  }
}