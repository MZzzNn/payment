import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color_manager.dart';

class ThemeManager {
  ThemeManager._();

  static ThemeData get lightTheme => ThemeData(
      primarySwatch: buildMaterialColor(ColorManager.primary),
      primaryColor: ColorManager.primary,
      brightness: Brightness.light,
      platform: TargetPlatform.iOS,
      scaffoldBackgroundColor: ColorManager.white,
      iconTheme: const IconThemeData(color: ColorManager.primary),
      appBarTheme: const AppBarTheme(
        titleSpacing: 20.0,
        centerTitle: true,
        color: ColorManager.primary,
        titleTextStyle: TextStyle(
          color: ColorManager.white,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: ColorManager.white, size: 28),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.primary,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      );

  static ThemeData get darkTheme => ThemeData();




}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
