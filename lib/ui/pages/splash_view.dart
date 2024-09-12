import 'dart:async';

import 'package:catbreeds/core/core.dart';
import 'package:catbreeds/ui/ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double scaleFactor = 0.5;
  double opacityLevel = 0;
  Color backgroundColor = CustomColor.foregroundColor;

  void animateSplash() async {
    Timer(Duration(seconds: 1), () {
      setState(() {
        scaleFactor = 1.5;
        opacityLevel = 1;
      });
    });

    Timer(Duration(seconds: 3), () {
      setState(() {
        scaleFactor = 1;
      });
    });

    Timer(Duration(seconds: 5), () {
      setState(() {
        scaleFactor = 100;
        backgroundColor = CustomColor.mainColor;
      });
    });
  }

  void goToHome() {
    Timer(Duration(seconds: 7), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeView()),
          (Route<dynamic> route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    animateSplash();
    goToHome();
  }

  @override
  Widget build(BuildContext context) {
    const int seconds = 2;
    const Curve curve = Curves.slowMiddle;

    return MaterialApp(
      home: Scaffold(
        body: AnimatedContainer(
          duration: const Duration(seconds: seconds),
          color: backgroundColor,
          padding: EdgeInsets.all(36),
          child: Center(
            child: AnimatedOpacity(
              opacity: opacityLevel,
              curve: curve,
              duration: const Duration(seconds: 1),
              child: AnimatedScale(
                curve: curve,
                scale: scaleFactor,
                duration: const Duration(seconds: seconds),
                child: SvgPicture.asset(
                  ImagesManager.logoSVG,
                  colorFilter:
                      ColorFilter.mode(CustomColor.mainColor, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
