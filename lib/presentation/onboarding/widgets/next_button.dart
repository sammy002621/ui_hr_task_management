import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/presentation/onboarding/bloc/cubit/onboarding_cubit.dart';

class NextButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final void Function()? onIndexChange;
  const NextButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.onIndexChange});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, index) {
      return GestureDetector(
        onTap:
            index == 3 ? onIndexChange : onTap,
        child: Container(
          width: 360,
          height: 60,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 60, 21, 218),
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              index == 3 ? "Sign In" : title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
    });
  }
}
