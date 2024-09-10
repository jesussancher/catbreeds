import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CatCardImageLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
        shimmerColor: Colors.grey[350]!,
        shimmerDuration: 3000,
        child: Container(
          height: 130,
          color: Colors.grey[300],
          width: MediaQuery.of(context).size.width * 0.35,
        ));
  }
}
