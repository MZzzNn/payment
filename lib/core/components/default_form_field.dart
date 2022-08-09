import 'package:flutter/material.dart';
import '../style/color_manager.dart';

/// A class that creates a text field with a label and a suffix icon.
class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final FormFieldValidator<String> validate;
  final String hintText;
  final Widget? suffix;
  final IconData? prefixIcon;
  final bool isPassword;
  final String? helpText;
  final TextInputAction? textInputAction;

  const DefaultFormField(
      {Key? key,
      required this.controller,
      required this.type,
      required this.hintText,
      required this.validate,
      this.suffix,
      this.isPassword = false,
      this.prefixIcon,
      this.helpText,
      this.textInputAction,
      this.onSubmit,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator: validate,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      textInputAction: textInputAction ?? TextInputAction.next,
      cursorColor: ColorManager.primary,
      style: const TextStyle(
        fontSize: 19.0,
        fontWeight: FontWeight.w500,
        color: ColorManager.textGrey,
      ),
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: ColorManager.primary)
            : null,
        suffixIcon: suffix,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFBC7C7C7), width: 2),
            borderRadius: BorderRadius.circular(50)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFBC7C7C7), width: 2),
            borderRadius: BorderRadius.circular(50)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFBC7C7C7), width: 2),
            borderRadius: BorderRadius.circular(50)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
