/*
 *  Webkul Software.
 *  @package  Mobikul Application Code.
 *  @Category Mobikul
 *  @author Webkul <support@webkul.com>
 *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *  @license https://store.webkul.com/license.html 
 *  @link https://store.webkul.com/license.html
 *
 */

import 'package:flutter/material.dart';

class MobikulTheme {
  ///this is basic color of app used for filling inside widgets where needed
  static Color primaryColor = Colors.white;

  ///this color will use for all the buttons,icon colors etc.
  static Color accentColor = const Color(0xFF8473F3);

  ///this is for all appbar icons
  static Color appBarItemColor = Colors.black;

  ///this is for app bar background color
  static Color appBarBackgroundColor = Colors.grey.shade400;

  ///this is for primary text color of buttons
  static Color primaryButtonTextColor = Colors.white;

  static Color successColor = const Color(0xFF22bb33);
  static Color errorColor = const Color(0xFFBB2124);
  static Color warningColor = const Color(0xFFf0ad4e);
  static Color discountColor = const Color(0xFF6BC700);


  ///this is the basic theme of app. color and view of all the screens are based on this theme.
  static ThemeData mobikulTheme = ThemeData(
    // cardColor: Colors.white,
    iconTheme: IconThemeData(
      color: accentColor,
    ),
    fontFamily: 'Montserrat',
    primaryColor: primaryColor,
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Montserrat',
      ),
      displaySmall: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
          fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold
      )
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade100,
      iconTheme: IconThemeData(color: appBarItemColor),
      shadowColor: appBarBackgroundColor,
    ),
  );
}
