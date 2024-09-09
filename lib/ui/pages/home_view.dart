import 'package:catbreeds/core/assets/colors.dart';
import 'package:catbreeds/core/assets/images_manager.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/presentation/home_viewmodel.dart';
import 'package:catbreeds/ui/widgets/cat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      return Scaffold(
          backgroundColor: CustomColor.backgroundColor,
          appBar: AppBar(
            title: SvgPicture.asset(
              ImagesManager.logoSVG,
              width: 100,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: PagedListView<int, Cat>(
              pagingController: model.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Cat>(
                itemBuilder: (context, cat, index) => CatCard(cat),
              ),
            ),
          )
          // This trailing comma makes auto-formatting nicer for build methods.
          );
    });
  }
}
