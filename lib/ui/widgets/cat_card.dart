import 'package:catbreeds/core/assets/colors.dart';
import 'package:catbreeds/core/assets/images_manager.dart';
import 'package:catbreeds/ui/widgets/chip.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CatCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            color: CustomColor.cardBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            // border: Border.all(
            //   color: CustomColor.borderColor,
            // ),
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
                  SizedBox(
                    height: 100,
                    child: Image.network(
                        'https://www.alleycat.org/wp-content/uploads/2019/03/FELV-cat.jpg'),
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
                            'CO',
                            width: 14,
                            height: 14,
                            shape: Circle(),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'CO',
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
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nombre de raza',
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
                              backgroundColor: Color(0x5218FFFF),
                              children: Row(
                                children: [
                                  Icon(
                                    Icons.handshake_rounded,
                                    size: 12,
                                    color: Color(0xFF0F9494),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '5',
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
                              backgroundColor:
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
                                    '4',
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
                          backgroundColor: CustomColor.transparentColor,
                          children: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 12,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${'14 - 15'.replaceAll(' ', '')} years',
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
  }
}
