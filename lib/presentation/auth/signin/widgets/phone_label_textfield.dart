import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signin/bloc/phone_number_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_state.dart';

class PhoneLabelTextfield extends StatefulWidget {
  final String label;
  final double? padding;
  final TextEditingController? controller;
  final void Function(PhoneNumber phoneNumber)? onChanged;
  PhoneLabelTextfield({
    super.key,
    required this.label,
    required this.onChanged,
    this.controller,
    this.padding,
  });

  @override
  _PhoneLabelTextfieldState createState() => _PhoneLabelTextfieldState();
}

class _PhoneLabelTextfieldState extends State<PhoneLabelTextfield> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding ?? 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 17,
                color: AppColors.descriptionColor,
              ),
            ),
          ),
          // Dropdown and TextField

          //NOTE:' since this is a custom package i would be able to directly change it into a textFormField and that's among the ways that the function onChange can do it's work of validating the input as well as the others 
          IntlPhoneField(
            onCountryChanged: (country) {
              context.read<PhoneNumberCubit>().changeDialCode(country.dialCode);
            },
            controller: widget.controller,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
              labelStyle: TextStyle(
                color: AppColors.hintColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.hintColor,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),

              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),

              focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.red,width: 2.0,),
    ),
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        )
              // errorText: 'Invalid Phone Number'
            ),
            initialCountryCode: 'IN',
            onChanged: widget.onChanged ,
          ),
        ],
      ),
    );
  }
}
