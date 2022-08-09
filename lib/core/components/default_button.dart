import 'package:flutter/material.dart';

import '../style/color_manager.dart';

/// A custom button that has a default style
class DefaultButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Function onPressed;
  final bool isUppercase;
  final double radius;
  final String text;
  final Color buttonColor;

  const DefaultButton({
    Key? key,
    this.width,
    this.isUppercase = false,
    this.radius = 35.0,
    required this.text,
    required this.onPressed,
    this.height,
    this.buttonColor = ColorManager.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 60,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPressed: () => onPressed(),
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          textAlign: TextAlign.center,
          style:const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: ColorManager.white,
          ),
        ),
      ),
    );
  }
}
