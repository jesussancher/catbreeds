import 'package:catbreeds/core/assets/colors.dart';
import 'package:flutter/material.dart';

class DummySearchBar extends StatelessWidget {
  final bool show;
  final String text;

  const DummySearchBar({
    required this.show,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 200),
      height: show ? 50 : 0,
      margin: EdgeInsets.symmetric(vertical: show ? 16 : 0, horizontal: 16),
      padding: EdgeInsets.all(show ? 12 : 0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: CustomColor.backgroundEnphasisColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: CustomColor.foreground500Color,
          ),
          const SizedBox(width: 16),
          Text(
            text,
            key: ValueKey<String>(text),
            style: TextStyle(
              color: CustomColor.foreground500Color,
            ),
          ),
        ],
      ),
    );
  }
}
