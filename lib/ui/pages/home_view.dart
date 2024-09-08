import 'package:catbreeds/core/assets/images_manager.dart';
import 'package:catbreeds/presentation/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            ImagesManager.logoSVG,
            width: 100,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              model.searchQuery,
            ),
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}
