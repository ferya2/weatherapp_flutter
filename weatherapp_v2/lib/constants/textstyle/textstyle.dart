import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp_v2/constants/colors/colors.dart';

class AppTextStyles {
  static TextStyle titleStyleBrown = GoogleFonts.openSans(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorsCollection.blackNeutral);
  static TextStyle titleStyle = GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: ColorsCollection.whiteNeutral.withOpacity(0.5));

  static TextStyle subTitleStyle = GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: ColorsCollection.whiteNeutral);
  static TextStyle weatherTitle = GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: ColorsCollection.blackNeutral);
  static TextStyle cityTitle = GoogleFonts.openSans(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: ColorsCollection.whiteNeutral);
  static TextStyle dateTitle = GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: ColorsCollection.whiteNeutral);
  static TextStyle celciusText = GoogleFonts.openSans(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: ColorsCollection.whiteNeutral);
  static TextStyle weatherStatus = GoogleFonts.openSans(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: ColorsCollection.whiteNeutral);
}
