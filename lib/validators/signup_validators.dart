// class to hand signup validation
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:workmate/presentation/auth/signup/bloc/text_form_cubit.dart';

class SignupValidators {
  // function to validate the email address
  static String? Function(String?)? validateEmail = (String? email) {
    if (email == null || email.isEmpty) return "Email is required";
    final regex = RegExp(r"^[^@]+@[^@]+\.[a-zA-Z]{2,}$");
    return regex.hasMatch(email) ? null : "Please enter valid email";
  };

// function to validate company id
  static String? Function(String?) validateCompanyId = (String? companyId) {
    if (companyId == null || companyId.isEmpty) {
      return "Company ID is required";
    }

    if (!companyId.startsWith("COMP-")) {
      return "ID should start with COMP-";
    }

    // Remove "COMP-" and  if remaining part is exactly 8 characters
    String remainingPart = companyId.substring(5); // 5 is length of "COMP-"
    if (remainingPart.length != 6) {
      return "6 characters required after COMP-";
    }

    return null; // Return null when validation passes
  };

// function to validate the password

  static String? Function(String?) validatePassword = (String? password) {
    if (password == null || password.isEmpty) {
      return "Password required";
    }

    if (password.length < 8) {
      return "Min 8 characters";
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasDigit = password.contains(RegExp(r'[0-9]'));
    bool hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase) {
      return "Add uppercase letter";
    }

    if (!hasLowercase) {
      return "Add lowercase letter";
    }

    if (!hasDigit) {
      return "Add a number";
    }

    if (!hasSpecialChar) {
      return "Add special char (!@#\$...)";
    }

    return null;
  };

// function to validate confirm password

  static String? Function(String?) validateConfirmPassword(String? password) {
    return (String? confirmPassword) {
      if (confirmPassword == null || confirmPassword.isEmpty) {
        return "Password required";
      }

      if (confirmPassword != password) {
        return "Passwords must match";
      }

      return null;
    };
  }





// function to validate the phoneNumber field 
static String? validatePhoneNumber(PhoneNumber? phone,TextEditingController? controller){
     if (phone!.number.isEmpty) {
                  return "Phone Number is Required";
                }
                return null;
}

// function to check if the whole form is validated
  static void validateForm(BuildContext context, GlobalKey<FormState> formKey) {
    // Check if the whole form is valid
    final isValid = formKey.currentState?.validate() ?? false;
    context.read<TextFormCubit>().updateIsFormValid(isValid);
    print(context.read<TextFormCubit>().state.isFormValid);
  }
}
