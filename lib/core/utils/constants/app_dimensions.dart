import 'package:flutter/cupertino.dart';

class AppDimensions {
  AppDimensions._();

  static const double small = 14;
  static const double medium = 16;
  static const double large = 18;
  static const double xLarge = 20;
  static const double xxLarge = 22;
  static const double xxxLarge = 26;
  static const double smallDisplay = 30;
  static const double mediumDisplay = 34;

  static const double buttonHeight = 52;

  static const double smallBorderRadius = 8;
  static const double mediumBorderRadius = 16;
  static const double largeBorderRadius = 24;

  static const EdgeInsets pagePadding = EdgeInsets.symmetric(
    vertical: AppPadding.xLarge,
    horizontal: AppPadding.xLarge
  );
}

class AppPadding{
  static const double xSmall = 4;
  static const double small = 8;
  static const double medium = 16;
  static const double large = 20;
  static const double xLarge = 24;
  static const double xxLarge = 28;

  static const double smallDisplay = 30;
  static const double mediumDisplay = 36;
  static const double largeDisplay = 48;
}