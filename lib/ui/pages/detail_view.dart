import 'package:catbreeds/core/core.dart';
import 'package:catbreeds/core/typography.dart';
import 'package:catbreeds/domain/domain.dart';
import 'package:catbreeds/ui/ui.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final Cat cat;
  const DetailView(this.cat);

  @override
  Widget build(BuildContext context) {
    const double toolbarHeight = 70;
    return Scaffold(
        backgroundColor: CustomColor.backgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: toolbarHeight,
          backgroundColor: CustomColor.backgroundColor.withOpacity(0.5),
          forceMaterialTransparency: true,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.chevron_left_rounded,
              size: 32,
              color: CustomColor.backgroundColor,
            ),
          ),
        ),
        body: Stack(children: [
          Positioned(
            top: 0,
            child: Stack(
              children: [
                (!cat.hasImage)
                    ? CatCardImageLoader()
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width,
                        child: CachedImage(
                          url: cat.imageUrlJPG ?? '',
                          altUrl: cat.imageUrlPNG ?? '',
                          placeholder: SizedBox(),
                        ),
                      ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                        0.75,
                        1
                      ],
                          colors: [
                        CustomColor.transparentColor,
                        CustomColor.backgroundColor,
                      ])),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5 +
                  (toolbarHeight / 2),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: CustomColor.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: CustomColor.shadowColor,
                    blurRadius: 20,
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
              ),
              padding: const EdgeInsets.all(16),
              child: RawScrollbar(
                thumbColor: CustomColor.mainColor,
                radius: const Radius.circular(8),
                crossAxisMargin: 2,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText.title(
                            cat.name ?? '',
                            color: CustomColor.mainColor,
                          ),
                          Row(
                            children: [
                              CountryFlag.fromCountryCode(
                                cat.countryCode ?? '',
                                width: 16,
                                height: 16,
                                shape: Circle(),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                cat.origin ?? '',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              ChipWithIcon(
                                value:
                                    '${cat.lifeSpan?.replaceAll(' ', '')} years',
                                iconName: ImagesManager.lifeIcon,
                                color: Colors.red,
                                shrink: true,
                                showShadow: false,
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        cat.description ?? '',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: CustomColor.foreground500Color,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        cat.temperament ?? '',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: CustomColor.foreground500Color,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _CategoryCard(
                        title: 'Physical Characteristics',
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ChipWithIcon(
                                  value:
                                      '${cat.weight?.metric?.replaceAll(' ', '')} kgs',
                                  iconName: ImagesManager.weightIcon,
                                  color: Colors.blue,
                                  padding: EdgeInsets.all(6),
                                ),
                                const SizedBox(width: 8),
                                ChipWithIcon(
                                  value: cat.indoor.toBoolean
                                      ? 'Indoor'
                                      : 'Not indoor',
                                  iconName: ImagesManager.homeIcon,
                                  color: Colors.orange,
                                  padding: EdgeInsets.all(6),
                                ),
                                const SizedBox(width: 8),
                                ChipWithIcon(
                                  value: cat.suppresedTail.toBoolean
                                      ? 'Has no tail'
                                      : 'Has tail',
                                  iconName: ImagesManager.standingCatIcon,
                                  color: Colors.green,
                                  padding: EdgeInsets.all(6),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                ChipWithIcon(
                                  value:
                                      cat.indoor.toBoolean ? 'Laps' : 'No laps',
                                  iconName: ImagesManager.catLapIcon,
                                  color: Colors.purple,
                                  shrink: true,
                                  padding: EdgeInsets.all(6),
                                ),
                                const SizedBox(width: 8),
                                ChipWithIcon(
                                  value: cat.shortLegs.toBoolean
                                      ? 'Short legs'
                                      : 'Long legs',
                                  iconName: ImagesManager.standingCatIcon,
                                  color: Colors.pink,
                                  padding: EdgeInsets.all(6),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      _CategoryCard(
                        title: 'Behavior and Personality',
                        content: BehaviorAndPersonalityTable(cat),
                      ),
                      _CategoryCard(
                        title: 'Genetic Traits',
                        content: GeneticTraitsCharts(cat),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final Widget content;
  const _CategoryCard({
    required this.title,
    required this.content,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: CustomColor.backgroundEmphasisColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: CustomColor.foregroundColor,
            ),
          ),
          const SizedBox(height: 12),
          content,
        ],
      ),
    );
  }
}
