import 'package:flutter/material.dart';
import 'package:workmate/core/configs/theme/app_colors.dart';

class LabelTextfield extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? inputType;
  final bool? obscureText;
  final double? padding;
  final List<String>? dropdownItems; // List of dropdown items (country codes)
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
      padding:  EdgeInsets.symmetric(horizontal: widget.padding ?? 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 20,
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
              Expanded(
                child: TextField(
                  controller: textController,
                  obscureText: widget.obscureText ?? false,
                  keyboardType:
                      getKeyboardInputType(widget.inputType ?? 'text'),
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      color: AppColors.hintColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Icon(
                            widget.prefixIcon,
                            color: AppColors.primaryColor,
                            size: 30,
                          ) ??
                          SizedBox.shrink()
                    ),
                    suffixIcon: Icon(
                      widget.suffixIcon,
                      color: AppColors.primaryColor,
                      size: 30,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
