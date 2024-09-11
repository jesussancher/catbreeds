import 'package:catbreeds/core/assets/colors.dart';
import 'package:catbreeds/core/assets/images_manager.dart';
import 'package:catbreeds/presentation/search_viewmodel.dart';
import 'package:catbreeds/ui/widgets/cat_card.dart';
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
            // leading: IconButton(
            //   icon: Icon(Icons.chevron_left_rounded),
            //   onPressed: () => model.goBack(context),
            // ),
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
              // DummySearchBar(
              //   show: !model.scrolled,
              //   text: model.dummyCatName,
              // ),
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
