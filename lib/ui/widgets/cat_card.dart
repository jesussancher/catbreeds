import 'package:catbreeds/core/assets/colors.dart';
import 'package:catbreeds/core/assets/images_manager.dart';
import 'package:catbreeds/core/di/di.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:catbreeds/presentation/cat_card_viewmodel.dart';
import 'package:catbreeds/ui/widgets/chip.dart';
import 'package:catbreeds/ui/widgets/custom_icon.dart';
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
    const double cardHeight = 140;
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
                        (imageUrl == null)
                            ? CatCardImageLoader()
                            : SizedBox(
                                height: cardHeight,
                                width: MediaQuery.of(context).size.width * 0.33,
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
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
                                  Text(
                                    cat.name ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
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
                                      Text(
                                        cat.origin ?? '',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                CustomColor.foreground500Color),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              _ChipWithIcon(
                                value:
                                    '${cat.lifeSpan?.replaceAll(' ', '')} years',
                                iconName: ImagesManager.lifeIcon,
                                color: Colors.red,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  _ChipWithIcon(
                                    value: cat.intelligence?.toString() ?? '',
                                    iconName: ImagesManager.intelligenceIcon,
                                    color: Color(0xFF0F9494),
                                  ),
                                  const SizedBox(width: 4),
                                  _ChipWithIcon(
                                    value: cat.energyLevel?.toString() ?? '',
                                    iconName: ImagesManager.energyIcon,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(width: 4),
                                  _ChipWithIcon(
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
            });
      }),
    );
  }
}

class _ChipWithIcon extends StatelessWidget {
  final String? iconName;
  final Color? color;
  final String value;

  const _ChipWithIcon({
    this.iconName,
    this.color,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return ChipWidget(
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: CustomColor.shadowColor,
          blurRadius: 10,
        )
      ],
      children: Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Row(
          children: [
            if (iconName != null) ...[
              Container(
                height: 20,
                width: 20,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: color?.withAlpha(30),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CustomIcon(
                  icon: iconName!,
                  color: color,
                ),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              value,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
