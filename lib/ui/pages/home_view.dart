import 'package:catbreeds/core/assets/colors.dart';
import 'package:catbreeds/core/assets/images_manager.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/presentation/home_viewmodel.dart';
import 'package:catbreeds/ui/widgets/cat_card.dart';
import 'package:catbreeds/ui/widgets/dummy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, model, child) {
      return Scaffold(
          backgroundColor: CustomColor.backgroundColor,
          appBar: AppBar(
            backgroundColor: CustomColor.backgroundColor,
            title: SvgPicture.asset(
              ImagesManager.logoSVG,
              width: 100,
            ),
            actions: [
              AnimatedOpacity(
                opacity: model.scrolled ? 1 : 0,
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: CustomColor.foregroundColor,
                    ),
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                      model.goToSearchView(context);
                    },
                  ),
                ),
              )
            ],
          ),
          body: RawScrollbar(
            thumbColor: CustomColor.mainColor,
            radius: const Radius.circular(8),
            crossAxisMargin: 2,
            controller: model.scrollController,
            child: Column(
              children: [
                AnimatedContainer(
                  curve: Curves.decelerate,
                  height: model.scrolled ? 16 : 0,
                  duration: Duration(milliseconds: 200),
                ),
                DummySearchBar(
                  show: !model.scrolled,
                  text: model.dummyCatName,
                  onTap: model.goToSearchView,
                ),
                Expanded(
                  child: PagedListView<int, Cat>(
                    addRepaintBoundaries: false,
                    scrollController: model.scrollController,
                    pagingController: model.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<Cat>(
                      itemBuilder: (context, cat, index) => CatCard(cat),
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
