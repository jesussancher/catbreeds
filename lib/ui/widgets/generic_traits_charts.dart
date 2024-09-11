import 'package:catbreeds/core/assets/colors.dart';
import 'package:catbreeds/domain/models/cat.dart';
import 'package:flutter/material.dart';

class GeneticTraitsCharts extends StatelessWidget {
  final Cat cat;
  const GeneticTraitsCharts(this.cat);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildSwitchRow('Experimental', cat.experimental),
          _buildSwitchRow('Natural', cat.natural),
          _buildSwitchRow('Rare', cat.rare),
          _buildSwitchRow('Rex', cat.rex),
          _buildSwitchRow('Hypoallergenic', cat.hypoallergenic),
        ],
      ),
    );
  }

  Widget _buildSwitchRow(String traitName, int? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          traitName,
          style: TextStyle(
            color: CustomColor.foreground500Color,
          ),
        ),
        SizedBox(
          height: 32,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Switch.adaptive(
              value: value == 0,
              onChanged: (bool newValue) {},
              activeColor: CustomColor.mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
