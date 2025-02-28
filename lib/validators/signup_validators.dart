// class to hand signup validation
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:workmate/presentation/auth/signup/bloc/text_form_cubit.dart';

class SignupValidators {
  // function to validate the email address
  static String? validateEmail(BuildContext context, String? email) {
    if (email == null || email.isEmpty) {
      context.read<TextFormCubit>().updateEmailValid(false);
      return "Email is required";
    }
    final regex = RegExp(r"^[^@]+@[^@]+\.[a-zA-Z]{2,}$");
    final emailValid = regex.hasMatch(email);
    context.read<TextFormCubit>().updateEmailValid(emailValid);
    return emailValid ? null : "Enter Valid Email";
  }

  // function to validate company id
  static String? validateCompanyId(BuildContext context, String? companyId) {
    if (companyId == null || companyId.isEmpty) {
      context.read<TextFormCubit>().updateCompanyIdValid(false);
      return "Company ID is required";
    }

    if (!companyId.startsWith("COMP-")) {
      context.read<TextFormCubit>().updateCompanyIdValid(false);
      return "ID should start with COMP-";
    }

    String remainingPart = companyId.substring(5);
    if (remainingPart.length != 6) {
      context.read<TextFormCubit>().updateCompanyIdValid(false);
      return "6 characters required after COMP-";
    }

    context.read<TextFormCubit>().updateCompanyIdValid(true);
    return null;
  }

  // function to validate the password
  static String? validatePassword(BuildContext context, String? password) {
    if (password == null || password.isEmpty) {
      context.read<TextFormCubit>().updatePasswordValid(false);
      return "Password required";
    }

    if (password.length < 8) {
      context.read<TextFormCubit>().updatePasswordValid(false);
      return "Min 8 characters";
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasDigit = password.contains(RegExp(r'[0-9]'));
    bool hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase) {
      context.read<TextFormCubit>().updatePasswordValid(false);
      return "Add uppercase letter";
    }

    if (!hasLowercase) {
      context.read<TextFormCubit>().updatePasswordValid(false);
      return "Add lowercase letter";
    }

    if (!hasDigit) {
      context.read<TextFormCubit>().updatePasswordValid(false);
      return "Add a number";
    }

    if (!hasSpecialChar) {
      context.read<TextFormCubit>().updatePasswordValid(false);
      return "Add special char (!@#\$...)";
    }

    context.read<TextFormCubit>().updatePasswordValid(true);
    return null;
  }

  // function to validate confirm password
  static String? validateConfirmPassword(BuildContext context, String password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      context.read<TextFormCubit>().updateConfirmPasswordValid(false);
      return "Password required";
    }

    if (confirmPassword != password) {
      context.read<TextFormCubit>().updateConfirmPasswordValid(false);
      return "Passwords must match";
    }

    context.read<TextFormCubit>().updateConfirmPasswordValid(true);
    return null;
  }

  // function to validate the phoneNumber field
  static String? validatePhoneNumber(BuildContext context, PhoneNumber? phone, TextEditingController? controller) {
    if (phone!.number.isEmpty || controller!.text.isEmpty) {
      context.read<TextFormCubit>().updatePhoneNumberValid(false);
      return "Phone Number is Required";
    }

    context.read<TextFormCubit>().updatePhoneNumberValid(true);
    return null;
  }

  
    // separate logic to validate the phone number on it's own
    // phone_number_validated = false ; // initially if the phone number field is completely validated then phone_number_validated = true then return
}
