import 'package:catbreeds/core/assets/colors.dart';
import 'package:catbreeds/core/assets/images_manager.dart';
import 'package:catbreeds/presentation/search_viewmodel.dart';
import 'package:catbreeds/ui/widgets/cat_card.dart';
import 'package:catbreeds/ui/widgets/custom_icon.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchViewModel>(builder: (context, model, child) {
      return Scaffold(
          backgroundColor: CustomColor.backgroundColor,
          appBar: AppBar(
            backgroundColor: CustomColor.backgroundColor,
            title: SvgPicture.asset(
              ImagesManager.logoSVG,
              width: 100,
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: model.inputController,
                    onChanged: model.onSearch,
                    // focusNode: focusNode,
                    style: TextStyle(
                      color: CustomColor.foreground500Color,
                      fontSize: 14,
                    ),
                    cursorColor: CustomColor.mainColor,
                    cursorHeight: 16,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: CustomColor.backgroundEnphasisColor,
                      hintText: 'Search for your prefurrrred cat breeds',
                      hintStyle: TextStyle(
                        color: CustomColor.foreground500Color,
                        fontSize: 14,
                      ),
                      contentPadding: EdgeInsets.all(12),
                    ),
                  ),
                ),
              ),
              if (model.showFirstSearch)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIcon(
                        icon: ImagesManager.standingCatIcon,
                        size: 24,
                      ),
                      Text("Let's search for ${model.dummyCatName}!"),
                    ],
                  ),
                )
              else if (model.showNoResults)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIcon(
                        icon: ImagesManager.standingCatIcon,
                        size: 24,
                      ),
                      Text("No cat breeds are called ${model.searchText}!"),
                      Text("Let's try with ${model.dummyCatName}!"),
                    ],
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: model.catsList.length,
                    addRepaintBoundaries: false,
                    itemBuilder: (context, index) =>
                        CatCard(model.catsList.elementAt(index)),
                  ),
                ),
            ],
          ));
    });
  }
}
