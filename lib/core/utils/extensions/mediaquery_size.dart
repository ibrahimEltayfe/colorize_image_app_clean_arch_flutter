import 'package:flutter/material.dart';

extension MediaQuerySize on BuildContext{
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}