import 'package:flutter/material.dart';

extension CustomContext on BuildContext {
  double screenHeight([double percent = 1]) =>
      MediaQuery.of(this).size.height * percent;

  double screenWidth([double percent = 1]) =>
      MediaQuery.of(this).size.width * percent;
}

extension StringExtension on String {
  String get png => "assets/images/$this.png";
  String get jpg => "assets/images/$this.jpg";
}
