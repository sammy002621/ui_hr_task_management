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

          // NOTE: the only thing that is left is to make sure that the user should type anything in the text field of the number because if they don't then they can submit incomplete information
          // NOTE: the package has it's own validation logic but is there a way to add my own validation logic too
          // NOTE: my logic is that the controller.text.length should atleast be equal to one
          FormField<PhoneNumber>(builder: (state) {
            return IntlPhoneField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (phone) {
                if (phone == null || widget.controller!.text.isEmpty) {
                  return 'Phone number is required';
                }
                return null;
              },
              onCountryChanged: (country) {
                context
                    .read<PhoneNumberCubit>()
                    .changeDialCode(country.dialCode);
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
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  )
                  // errorText: 'Invalid Phone Number'
                  ),
              initialCountryCode: 'IN',
              onChanged: widget.onChanged,
            );
          })
        ],
      ),
    );
  }
}
