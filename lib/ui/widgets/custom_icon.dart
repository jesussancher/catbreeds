import 'package:catbreeds/core/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  final String icon;
  final double? size;
  final Color? color;

  CustomIcon({required this.icon, this.size = 12, this.color});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
          color ?? CustomColor.foregroundColor, BlendMode.srcIn),
    );
  }
}
