import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class OneTimePasscodeTextFormField extends StatelessWidget {
  const OneTimePasscodeTextFormField({
    super.key,
    this.myHintText = '*',
    required this.fillColor,
    required this.hintTextColor,
    this.keyboardType = TextInputType.number,
    this.obscureText = false,
    required this.autoFocus,
    required this.controller,
    this.onChanged,
    this.focusNode,
  });

  final String myHintText;
  final Color? fillColor;
  final Color? hintTextColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final bool autoFocus;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      // textInputAction: TextInputAction.next,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      controller: controller,
      autofocus: autoFocus,
      // maxLength: 1,
      obscureText: obscureText,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: screenWidth(5),
          maxWidth: screenWidth(5),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.transparentColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColors.transparentColor,
          ),
        ),
        filled: true,
        hintStyle: TextStyle(
          color: hintTextColor,
        ),
        hintText: myHintText,
        fillColor: fillColor,
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}
