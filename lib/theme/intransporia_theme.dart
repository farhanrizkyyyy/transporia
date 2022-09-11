import 'package:flutter/material.dart';
import 'package:intransporia/theme/theme.dart';

class IntransporiaTheme {
  const IntransporiaTheme._();

  static get apply {
    const String defaultFont = 'Inter';
    const TextStyle bodyTextStyle = TextStyle(fontSize: 14.0, height: 1.4);
    final defaultTextTheme = ThemeData().textTheme.copyWith(
          bodySmall: bodyTextStyle,
          bodyMedium: bodyTextStyle,
          bodyLarge: bodyTextStyle,
          headlineLarge: const TextStyle(
            fontSize: 24.0,
            color: Constants.ink,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          headlineSmall: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: defaultFont,
            fontSize: 12.0,
          ),
        );

    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Constants.primary,
      iconTheme: const IconThemeData(color: Constants.primary),
      dividerColor: Constants.borderBase,
      listTileTheme: const ListTileThemeData(
        tileColor: Colors.white,
        style: ListTileStyle.list,
      ),
      textTheme: defaultTextTheme.apply(
        fontFamily: defaultFont,
        bodyColor: Constants.ink,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        backgroundColor: Constants.darkBlue3,
        iconSize: 34.0,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(color: Constants.darkBlue3),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Constants.ink),
        titleTextStyle: TextStyle(
          color: Constants.ink,
          fontFamily: defaultFont,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        suffixIconColor: Constants.sky,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
        hintStyle: TextStyle(color: Constants.sky2, fontFamily: defaultFont),
        errorStyle: TextStyle(color: Constants.red, fontFamily: defaultFont),
        prefixStyle: TextStyle(color: Constants.borderBase),
        labelStyle: TextStyle(
          fontSize: 13.0,
          color: Constants.darkBlue2,
          fontFamily: defaultFont,
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Constants.borderBase),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Constants.borderBase),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Constants.borderBase),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Constants.red),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Constants.red),
        ),
      ),
      tabBarTheme: const TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          color: Constants.orange2,
          fontWeight: FontWeight.w500,
          fontFamily: defaultFont,
        ),
        unselectedLabelStyle: TextStyle(
          color: Constants.ink,
          fontWeight: FontWeight.w500,
          fontFamily: defaultFont,
        ),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll(0.0),
          alignment: Alignment.center,
          shape: MaterialStatePropertyAll(StadiumBorder()),
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
          minimumSize: MaterialStatePropertyAll(Size(328.0, 54.0)),
          maximumSize: MaterialStatePropertyAll(Size(328.0, 54.0)),
          backgroundColor: MaterialStatePropertyAll(Constants.darkBlue3),
        ),
      ),
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          shape: MaterialStatePropertyAll(StadiumBorder()),
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
          minimumSize: MaterialStatePropertyAll(Size(328.0, 54.0)),
          maximumSize: MaterialStatePropertyAll(Size(328.0, 54.0)),
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          side: MaterialStatePropertyAll(
            BorderSide(color: Constants.borderBase),
          ),
        ),
      ),
    );
  }
}
