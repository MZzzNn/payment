import 'package:flutter/material.dart';

class ColorManager {

  ColorManager._();
  static const Color red = Color(0xFFBB3A25);
  static const Color primary = Color(0xff19A44B);
  static const Color textBlack =  Color(0xff141A1F);
  static const Color textGrey =  Color(0xff898989);
  static const Color grey = Color(0xffCED5E1);
  static const Color white = Color(0xFFFFFFFF);


}
extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
