import 'package:catbreeds/core/core.dart';
import 'package:catbreeds/domain/domain.dart';
import 'package:catbreeds/presentation/presentation.dart';
import 'package:catbreeds/ui/ui.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CatCard extends StatelessWidget {
  final Cat cat;
  const CatCard(this.cat);
  @override
  Widget build(BuildContext context) {
    const double cardHeight = 140;

    return ChangeNotifierProvider<CatCardViewModel>(
      create: (context) => getIt.get<CatCardViewModel>(),
      lazy: true,
      child: Consumer<CatCardViewModel>(builder: (context, model, child) {
        return GestureDetector(
          onTap: () {
            model.goToDetail(context, cat);
            HapticFeedback.heavyImpact();
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
            decoration: BoxDecoration(
                color: CustomColor.cardBackgroundColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: CustomColor.shadowColor,
                    blurRadius: 10,
                  )
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (!cat.hasImage)
                      ? CatCardImageLoader(
                          height: 140,
                          width: MediaQuery.of(context).size.width * 0.33,
                        )
                      : SizedBox(
                          height: cardHeight,
                          width: MediaQuery.of(context).size.width * 0.33,
                          child: CachedImage(
                            url: cat.imageUrlJPG!,
                            altUrl: cat.imageUrlPNG!,
                            placeholder: CatCardImageLoader(
                              height: 140,
                              width: MediaQuery.of(context).size.width * 0.33,
                            ),
                          ),
                        ),
                  Container(
                    height: cardHeight,
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText.subtitle(
                              cat.name ?? '',
                            ),
                            Row(
                              children: [
                                CountryFlag.fromCountryCode(
                                  cat.countryCode ?? '',
                                  width: 12,
                                  height: 12,
                                  shape: Circle(),
                                ),
                                const SizedBox(width: 4),
                                CustomText.chip(
                                  cat.origin ?? '',
                                  color: CustomColor.foreground500Color,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ChipWithIcon(
                          value: '${cat.lifeSpan?.replaceAll(' ', '')} years',
                          iconName: ImagesManager.lifeIcon,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            ChipWithIcon(
                              value: cat.intelligence?.toString() ?? '',
                              iconName: ImagesManager.intelligenceIcon,
                              color: Color(0xFF0F9494),
                            ),
                            const SizedBox(width: 4),
                            ChipWithIcon(
                              value: cat.energyLevel?.toString() ?? '',
                              iconName: ImagesManager.energyIcon,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 4),
                            ChipWithIcon(
                              value: 'About me',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
