import 'package:flutter/material.dart';
import 'package:notesapp/state_management/theme_provider.dart';

/// const Colors
Color darkBackgroundColor = const Color.fromARGB(255, 31, 29, 44);
Color tileColor = const Color.fromARGB(255, 38, 38, 54);
Color primaryColor = const Color.fromARGB(255, 112, 111, 200);
Color textFieldFillColor = const Color.fromRGBO(38, 38, 54, 1);
Color textColor = Colors.white;

currentTheme(brightness) {
  return ThemeData(
      useMaterial3: true,
      //   scaffoldBackgroundColor: darkBackgroundColor,
      // popupMenuTheme: PopupMenuThemeData(color: tileColor),
      brightness: Brightness.light,
      primaryColor: primaryColor,
      fontFamily: "Montserrat",
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor, foregroundColor: textColor))
      // snackBarTheme: SnackBarThemeData(
      //   backgroundColor: tileColor,
      //   actionTextColor: primaryColor,
      //   contentTextStyle: TextStyle(color: Colors.white),
      // ),
      // splashColor: Colors.transparent,
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //         backgroundColor: primaryColor, foregroundColor: Colors.white)),
      // scaffoldBackgroundColor: darkBackgroundColor,
      // listTileTheme: ListTileThemeData(tileColor: tileColor),
      // appBarTheme: AppBarTheme(
      //     backgroundColor: darkBackgroundColor, foregroundColor: Colors.white)
      );
}

//widget themes
