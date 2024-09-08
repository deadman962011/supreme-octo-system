import 'package:flutter/material.dart';
// f29d41
ThemeData light = ThemeData(
  fontFamily: 'Roboto', 
  primaryColor: const Color.fromRGBO(242, 157, 65, 1),
  secondaryHeaderColor: const Color.fromARGB(255, 255, 196, 132),
  disabledColor: const Color(0xFFA0A4A8),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color.fromRGBO(242, 157, 65, 1))),
  colorScheme: const ColorScheme.light(primary: Color.fromRGBO(242, 157, 65, 1), secondary: const Color.fromRGBO(242, 157, 65, 1)).copyWith(error: const Color(0xFFE84D4F)),
  popupMenuTheme: const PopupMenuThemeData(color: Colors.white, surfaceTintColor: Colors.white),
  dialogTheme: const DialogTheme(surfaceTintColor: Colors.white),
  floatingActionButtonTheme: FloatingActionButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500))),
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white, height: 60, padding: EdgeInsets.symmetric(vertical: 5)),
  dividerTheme: const DividerThemeData(thickness: 0.2, color: Color(0xFFA0A4A8)),
);