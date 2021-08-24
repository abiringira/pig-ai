import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:PigAi/styles/color.dart';

class ThemeScheme {
  static dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: dbackgroundColor,
      primaryColor: dprimaryColor,
      accentColor: dsecondaryColor,
      appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: lbackgroundColor,
      primaryColor: lprimaryColor,
      accentColor: lsecondaryColor,
      textTheme: textTheme,
      appBarTheme:
          AppBarTheme(iconTheme: IconThemeData(color: dbasicDarkColor)),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}

final TextStyle basicTextStyle = TextStyle(
  fontFamily: "SFUIDisplay",
  fontWeight: FontWeight.normal,
  fontSize: 16.0,
);

final TextTheme textTheme = TextTheme(
  body1: basicTextStyle,
  body2: basicTextStyle.merge(TextStyle(fontSize: 14.0)),
  title: basicTextStyle.merge(
    TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 30.0,
    ),
  ),
  subtitle: basicTextStyle.merge(
    TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12.0,
    ),
  ),
);
