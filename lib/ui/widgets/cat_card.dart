import 'package:catbreeds/core/assets/colors.dart';
import 'package:catbreeds/core/di/di.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/presentation/cat_card_viewmodel.dart';
import 'package:catbreeds/ui/widgets/chip.dart';
import 'package:catbreeds/ui/widgets/loaders/cat_card_image_loader.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CatCard extends StatelessWidget {
  final Cat cat;
  const CatCard(this.cat);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CatCardViewModel>(
      create: (context) => getIt.get<CatCardViewModel>(),
      lazy: true,
      child: Consumer<CatCardViewModel>(builder: (context, model, child) {
        return FutureBuilder(
            future: model.getCatImage(cat),
            builder: (context, snapshot) {
              final String? imageUrl = snapshot.data;
              return GestureDetector(
                onTap: () {
                  HapticFeedback.selectionClick();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                      color: CustomColor.cardBackgroundColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColor.shadowColor,
                          blurRadius: 5,
                        )
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            (imageUrl == null)
                                ? CatCardImageLoader()
                                : SizedBox(
                                    height: 130,
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            Positioned(
                              right: 0,
                              bottom: 4,
                              child: ChipWidget(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  bottomLeft: Radius.circular(6),
                                ),
                                children: Row(
                                  children: [
                                    CountryFlag.fromCountryCode(
                                      cat.countryCode ?? '',
                                      width: 14,
                                      height: 14,
                                      shape: Circle(),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      cat.countryCode ?? '',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cat.name ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ChipWidget(
                                        // borderColor: Color(0xFF0F9494),
                                        children: Row(
                                          children: [
                                            Icon(
                                              Icons.volunteer_activism_rounded,
                                              size: 12,
                                              color: Color(0xFF0F9494),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              cat.affectionLevel?.toString() ??
                                                  '',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF0F9494),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      ChipWidget(
                                        borderColor:
                                            Color.fromRGBO(76, 175, 79, 0.322),
                                        children: Row(
                                          children: [
                                            Icon(
                                              Icons.battery_5_bar_rounded,
                                              size: 12,
                                              color: Colors.green,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              cat.energyLevel?.toString() ?? '',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  ChipWidget(
                                    backgroundColor:
                                        CustomColor.transparentColor,
                                    children: Row(
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          size: 12,
                                          color: Colors.red,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${cat.lifeSpan?.replaceAll(' ', '')} years',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }
}
