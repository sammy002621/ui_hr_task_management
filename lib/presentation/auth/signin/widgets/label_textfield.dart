import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_cubit.dart';
import 'package:workmate/presentation/auth/signin/bloc/signup_state.dart';

class LabelTextfield extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? inputType;
  final bool? obscureText;
  final double? padding;
  final List<String>? dropdownItems; // List of dropdown items (country codes)
  void Function()? onTap;
  LabelTextfield({
    super.key,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.inputType,
    this.suffixIcon,
    this.obscureText,
    this.dropdownItems,
    this.padding,
    this.onTap,
  });

  @override
  _LabelTextfieldState createState() => _LabelTextfieldState();
}

class _LabelTextfieldState extends State<LabelTextfield> {
  String? selectedDropdownValue; // Selected dropdown value
  TextEditingController textController = TextEditingController();

  TextInputType getKeyboardInputType(String inputType) {
    switch (inputType.toLowerCase()) {
      case 'text':
        return TextInputType.text;
      case 'number':
        return TextInputType.number;
      case 'password':
        return TextInputType.visiblePassword;
      case 'email':
        return TextInputType.emailAddress;
      case 'phone':
        return TextInputType.phone;
      case 'multiline':
        return TextInputType.multiline;
      default:
        return TextInputType
            .text; // Default to text if inputType is unrecognized
    }
  }

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
          Row(
            children: [
              if (widget.dropdownItems !=
                  null) // Add dropdown if items are provided
                DropdownButton<String>(
                  value: selectedDropdownValue,
                  hint: Text("Code"),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDropdownValue = newValue;
                      textController.text =
                          "$selectedDropdownValue ${textController.text}";
                    });
                  },
                  items: widget.dropdownItems!
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              BlocBuilder<SignupCubit,SignupState>(
                builder: (context,state) {
                return Expanded(
                  child: TextField(
                    controller: textController,
                    obscureText: widget.obscureText ?? false,
                    keyboardType:
                        getKeyboardInputType(widget.inputType ?? 'text'),
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        color: AppColors.hintColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Icon(
                              widget.prefixIcon,
                              color: AppColors.primaryColor,
                              size: 25,
                            ) ??
                            SizedBox.shrink(),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: widget.onTap,
                        child: Icon(
                          widget.suffixIcon,
                          color: AppColors.primaryColor,
                          size: 25,
                        ),
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
                    ),
                  ),
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}
