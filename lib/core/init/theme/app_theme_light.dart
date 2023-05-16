import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight? get instance {
    _instance ??= AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  //ThemeData get theme => redTheme;
  @override
  ThemeData get theme => ThemeData(
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black87, size: 21),
          systemOverlayStyle: SystemUiOverlayStyle.light),
      focusColor: Colors.black12,
      inputDecorationTheme: const InputDecorationTheme(
        focusColor: Colors.black12,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        filled: true,
        labelStyle: TextStyle(),
        focusedBorder: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3)),
        // border: OutlineInputBorder(borderSide: BorderSide(width: 3)),
      ),
      scaffoldBackgroundColor: const Color(0xfff1f3f8),
      floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
      buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: ColorScheme.light(
            onError: Color(0xffFF2D55),
          )),
      fontFamily: ApplicationConstants.FONT_FAMILY,
      colorScheme: _appColorScheme,
      textTheme: textTheme(),
      tabBarTheme: tabBarTheme);

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelColor: _appColorScheme.onSecondary,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
      labelStyle: textThemeLight!.headline5,
      labelPadding: insets.lowPaddingAll,
      //unselectedLabelStyle: textThemeLight?.headline4.copyWith(color: colorSchemeLight!.gray),
    );
  }

  TextTheme textTheme() {
    return ThemeData.light().textTheme.copyWith(
          headline1: textThemeLight?.headline1,
          headline2: textThemeLight?.headline2,
          overline: textThemeLight?.headline3,
        );
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
        brightness: Brightness.light,
        primary: colorSchemeLight!.black,
        primaryContainer: Colors.white,
        secondaryContainer: colorSchemeLight!.azure,
        onPrimaryContainer: Colors.white, //x  ,
        onPrimary: Colors.greenAccent,
        secondary: Colors.green,
        onSecondary: Colors.black, //x
        error: Colors.red.shade900,
        onError: Color.fromARGB(255, 247, 182, 17), //xx
        background: Color(0xfff6f9fc), //xx
        onBackground: Colors.black12,
        surface: Colors.blue, //xx
        onSurface: Colors.white30);
  }
}
