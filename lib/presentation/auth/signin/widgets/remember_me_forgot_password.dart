import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_state.dart';

class RememberMeForgotPassword extends StatelessWidget {
  final void Function()? forgotPassword;
  const RememberMeForgotPassword({super.key,required this.forgotPassword});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
// remember me
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
                return Checkbox(
                  value: state.isSelected,
                  onChanged: (value) =>
                      context.read<SignupCubit>().updateIsSelected(),
                  checkColor: AppColors.primaryColor,
                  activeColor: const Color.fromARGB(255, 214, 213, 213),
                  side: BorderSide(color: AppColors.primaryColor, width: 2.0),
                );
              }),
              Text(
                "Remember Me",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
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
    );
  }
}
