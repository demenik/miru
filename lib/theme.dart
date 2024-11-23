import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var mocha = catppuccin.mocha;

var theme = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    shadowColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: false,
    color: mocha.base,
    titleTextStyle: TextStyle(
      color: mocha.text,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      systemNavigationBarDividerColor: mocha.base,
      systemNavigationBarColor: mocha.base,
    ),
    scrolledUnderElevation: 0.0,
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: mocha.base,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    elevation: 0.0,
    indicatorColor: Colors.transparent,
    labelTextStyle: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return TextStyle(color: mocha.mauve);
      }

      return TextStyle(color: mocha.text);
    }),
    iconTheme: WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.selected)) {
        return IconThemeData(color: mocha.mauve, size: 28);
      }

      return IconThemeData(color: mocha.text, size: 28);
    }),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: mocha.mauve,
    onPrimary: mocha.base,
    secondary: mocha.lavender,
    onSecondary: mocha.base,
    error: mocha.red,
    onError: mocha.text,
    surface: mocha.surface0,
    onSurface: mocha.text,
  ),
  scaffoldBackgroundColor: mocha.base,
  textTheme: const TextTheme(
    bodySmall: TextStyle(fontSize: 14),
    bodyMedium: TextStyle(fontSize: 16),
    bodyLarge: TextStyle(fontSize: 18),
  ),
);
