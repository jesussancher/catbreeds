import 'package:catbreeds/core/core.dart';
import 'package:catbreeds/domain/domain.dart';
import 'package:flutter/material.dart';

class BehaviorAndPersonalityTable extends StatelessWidget {
  final Cat cat;

  const BehaviorAndPersonalityTable(this.cat);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
          color: CustomColor.transparentColor,
          borderRadius: BorderRadius.circular(16)), // Add border to the table
      columnWidths: const {
        0: FlexColumnWidth(), // Width for first column
        1: FlexColumnWidth(), // Dynamic width for second column
      },
      children: [
        _buildRow('Adaptability', cat.adaptability),
        _buildRow('Affection Level', cat.affectionLevel),
        _buildRow('Child Friendly', cat.childFriendly),
        _buildRow('Dog Friendly', cat.dogFriendly),
        _buildRow('Energy Level', cat.energyLevel),
        _buildRow('Grooming', cat.grooming),
        _buildRow('Health Issues', cat.healthIssues),
        _buildRow('Intelligence', cat.intelligence),
        _buildRow('Shedding Level', cat.sheddingLevel),
        _buildRow('Social Needs', cat.socialNeeds),
        _buildRow('Stranger Friendly', cat.strangerFriendly),
        _buildRow('Vocalisation', cat.vocalisation),
      ],
    );
  }

  TableRow _buildRow(String attribute, int? value) {
    return TableRow(
      children: value == null
          ? [SizedBox(), SizedBox()]
          : [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText.paragraph(
                  attribute,
                  color: CustomColor.foreground500Color,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < value
                          ? Icons.star_rounded
                          : Icons.star_border_rounded,
                      color: index < value ? Colors.orange : Colors.grey,
                    );
                  }),
                ),
              ),
            ],
    );
  }
}
