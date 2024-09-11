import 'package:catbreeds/core/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DummySearchBar extends StatelessWidget {
  final bool show;
  final String text;
  final Function(BuildContext) onTap;

  const DummySearchBar({
    required this.show,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(context);
        HapticFeedback.heavyImpact();
      },
      child: AnimatedContainer(
        curve: Curves.decelerate,
        duration: Duration(milliseconds: 200),
        height: show ? 50 : 0,
        margin: EdgeInsets.symmetric(vertical: show ? 16 : 0, horizontal: 22),
        padding: EdgeInsets.all(show ? 12 : 0),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: CustomColor.backgroundEnphasisColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              key: ValueKey<String>(text),
              style: TextStyle(
                color: CustomColor.foreground500Color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.heavyImpact();
                },
                child: Icon(
                  Icons.search,
                  color: CustomColor.foreground500Color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
