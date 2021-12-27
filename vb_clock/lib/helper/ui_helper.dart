import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_helper.dart';

class UIHELPER {
  static final String snowLottieJson = _lottiePath("snow_santa");
  static final String letitLottieJson = _lottiePath("let_it_snow");
  static final String santaLottieJson = _lottiePath("santa");
  static final String snowFallLottieJson = _lottiePath("snow_fall");
  static final String christmasLottieJson = _lottiePath("christmas");
  static final String flyChristmasLottieJson = _lottiePath("fly_noel");

  static String _lottiePath(String val) => "assets/lottie/$val.json";

  static double dpHeight(BuildContext context, {double height}) =>
      MediaQuery.of(context).size.height * height ?? 1;

  static double dpWidth(BuildContext context, {double width}) =>
      MediaQuery.of(context).size.width * width ?? 1;

  static final Matrix4 transformValue = Matrix4.identity()
    ..setEntry(3, 2, .015)
    ..rotateX(-.3);

  /// [fontsize]
  static const double FONT_SIZE_HIGH = 100;
  static const double FONT_SIZE_MEDIUM = 50;
  static const double FONT_SIZE_NORMAL = 25;

  /// [Duration]
  static final lowDuration = Duration(milliseconds: 500);
  static final normalDuration = Duration(seconds: 1);

  /// [HEIGHT]
  ///
  static const double HEIGHT100 = 100;
  static const double HEIGHT200 = 200;

  ///[BOXSHADOW]
  static BoxShadow boxShadow(bool isOkey) {
    return BoxShadow(
      color: isOkey ? Colors.white : Colors.red,
      blurRadius: HEIGHT200,
      spreadRadius: 5.0,
      offset: Offset(.0, 10.0),
    );
  }

  /// [THemeData]
  static final snowTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    fontFamily: APPHELPER.FONT_FAMILY,
    textTheme: TextTheme(
      display1:
          TextStyle(fontSize: UIHELPER.FONT_SIZE_NORMAL, color: Colors.white),
      display2:
          TextStyle(fontSize: UIHELPER.FONT_SIZE_MEDIUM, color: Colors.white),
      display3:
          TextStyle(fontSize: UIHELPER.FONT_SIZE_HIGH, color: Colors.white),
    ),
  );
}
