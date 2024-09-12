import 'package:catbreeds/core/core.dart';
import 'package:catbreeds/ui/ui.dart';
import 'package:flutter/material.dart';

class ChipWithIcon extends StatelessWidget {
  final String? iconName;
  final Color? color;
  final String value;
  final EdgeInsets? padding;
  final bool shrink;
  final bool showShadow;
  final bool columnOrientation;
  final Color? backgroundColor;

  const ChipWithIcon({
    this.iconName,
    this.color,
    this.padding,
    this.shrink = false,
    this.showShadow = true,
    this.columnOrientation = false,
    this.backgroundColor,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return ChipWidget(
      borderRadius: BorderRadius.circular(14),
      boxShadow: showShadow
          ? [
              BoxShadow(
                color: CustomColor.shadowColor,
                blurRadius: 10,
              )
            ]
          : [],
      padding: padding,
      backgroundColor: backgroundColor,
      children: Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: columnOrientation
            ? Column(
                mainAxisSize: shrink ? MainAxisSize.min : MainAxisSize.max,
                children: [
                  if (iconName != null) ...[
                    Container(
                      height: 24,
                      width: 24,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: color?.withAlpha(30),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomIcon(
                        icon: iconName!,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisSize: shrink ? MainAxisSize.min : MainAxisSize.max,
                children: [
                  if (iconName != null) ...[
                    Container(
                      height: 20,
                      width: 20,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: color?.withAlpha(30),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomIcon(
                        icon: iconName!,
                        color: color,
                      ),
                    ),
                    const SizedBox(width: 6),
                  ],
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
