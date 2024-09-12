import 'package:catbreeds/core/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomText(
    this.text, {
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  factory CustomText.title(
    String text, {
    Color? color,
  }) {
    return CustomText(
      text,
      color: color ?? CustomColor.foregroundColor,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
