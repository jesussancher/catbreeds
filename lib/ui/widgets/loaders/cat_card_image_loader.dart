import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CatCardImageLoader extends StatelessWidget {
  final double width;
  final double height;

  const CatCardImageLoader({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
        shimmerColor: Colors.grey[350]!,
        shimmerDuration: 3000,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Container(
            height: height,
            width: width,
            color: Colors.grey[300],
          ),
        ));
  }
}
