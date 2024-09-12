import 'package:catbreeds/core/assets/colors.dart'; // Importing custom colors from the core assets
import 'package:flutter/material.dart'; // Importing Flutter material design components
import 'package:google_fonts/google_fonts.dart'; // Importing Google Fonts package for custom font styling

/// A customizable text widget that uses Google Fonts for styling.
/// This widget allows for different text styles such as title, subtitle, paragraph, and chip.
class CustomText extends StatelessWidget {
  // The text to display
  final String text;

  // Optional color for the text
  final Color? color;

  // Optional font size for the text
  final double? fontSize;

  // Optional font weight for the text
  final FontWeight? fontWeight;

  // Optional font style for the text (italic or normal)
  final FontStyle? fontStyle;

  /// Constructor for the CustomText widget.
  /// Allows setting the text and optional style parameters.
  const CustomText(
    this.text, {
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
  });

  /// Factory constructor for creating a title style text.
  /// Defaults to bold weight, larger font size, and primary color.
  factory CustomText.title(
    String text, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) {
    return CustomText(
      text,
      color: color ??
          CustomColor
              .foregroundColor, // Uses a default color if none is provided
      fontSize: 28, // Title font size
      fontWeight: fontWeight ?? FontWeight.bold, // Title font weight
      fontStyle: fontStyle,
    );
  }

  /// Factory constructor for creating a subtitle style text.
  /// Defaults to semi-bold weight, medium font size, and primary color.
  factory CustomText.subtitle(
    String text, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) {
    return CustomText(
      text,
      color: color ??
          CustomColor
              .foregroundColor, // Uses a default color if none is provided
      fontSize: 18, // Subtitle font size
      fontWeight: fontWeight ?? FontWeight.w600, // Subtitle font weight
      fontStyle: fontStyle,
    );
  }

  /// Factory constructor for creating a paragraph style text.
  /// Defaults to normal weight, smaller font size, and primary color.
  factory CustomText.paragraph(
    String text, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) {
    return CustomText(
      text,
      color: color ??
          CustomColor
              .foregroundColor, // Uses a default color if none is provided
      fontSize: 14, // Paragraph font size
      fontWeight: fontWeight ?? FontWeight.normal, // Paragraph font weight
      fontStyle: fontStyle,
    );
  }

  /// Factory constructor for creating a chip style text.
  /// Defaults to semi-bold weight, smaller font size, and primary color.
  factory CustomText.chip(
    String text, {
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
  }) {
    return CustomText(
      text,
      color: color ??
          CustomColor
              .foregroundColor, // Uses a default color if none is provided
      fontSize: 12, // Chip font size
      fontWeight: fontWeight ?? FontWeight.w600, // Chip font weight
      fontStyle: fontStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Builds the widget using the Google Poppins font for styling
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color, // Sets the text color
        fontSize: fontSize, // Sets the text size
        fontWeight: fontWeight, // Sets the font weight
        fontStyle: fontStyle, // Sets the font style (italic or normal)
      ),
    );
  }
}
