import 'package:catbreeds/core/assets/colors.dart';
import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String? text;
  final Widget? children;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;

  const ChipWidget({
    this.text,
    this.children,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderRadius,
    this.boxShadow,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
      decoration: BoxDecoration(
        color: backgroundColor ?? CustomColor.backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
        boxShadow: boxShadow,
      ),
      child: children ??
          Text(
            text ?? '',
            style: TextStyle(
              color: foregroundColor,
            ),
          ),
    );
  }
}
