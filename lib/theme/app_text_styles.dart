import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle h2SemiBold({Color color = Colors.white, underline = false}) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 1,
      decoration: underline ? TextDecoration.underline : null,
    );
  }

  static TextStyle h3Regular({Color color = Colors.white, underline = false}) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      height: 1,
      decoration: underline ? TextDecoration.underline : null,
    );
  }

  static TextStyle h3SemiBold({Color color = Colors.white, underline = false}) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 1,
      decoration: underline ? TextDecoration.underline : null,
    );
  }

  static TextStyle h4Regular({Color color = Colors.white, underline = false}) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 1,
      decoration: underline ? TextDecoration.underline : null,
    );
  }

  static TextStyle h4SemiBold({Color color = Colors.white, underline = false}) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1,
      decoration: underline ? TextDecoration.underline : null,
    );
  }

  static TextStyle h5Regular({Color color = Colors.white, underline = false}) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 1,
      decoration: underline ? TextDecoration.underline : null,
    );
  }

  static TextStyle h5SemiBold({Color color = Colors.white, underline = false}) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1,
      decoration: underline ? TextDecoration.underline : null,
    );
  }

  static TextStyle h5Bold({Color color = Colors.white, underline = false}) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      height: 1,
      decoration: underline ? TextDecoration.underline : null,
    );
  }

  static TextStyle h6Regular({
    Color color = Colors.white,
    underline = false,
    double height = 1,
  }) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: height,
      decoration: underline ? TextDecoration.underline : null,
    );
  }

  static TextStyle h6Bold({Color color = Colors.white, underline = false}) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1,
      decoration: underline ? TextDecoration.underline : null,
    );
  }

  static TextStyle paragraphRegular(
      {Color color = Colors.white, underline = false}) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1,
      decoration: underline ? TextDecoration.underline : null,
    );
  }

  static TextStyle customAll(
      {Color color = Colors.white,
      double fontSize = 18,
      FontWeight fontWeight = FontWeight.w400,
      double height = 1.5}) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
    );
  }
}
