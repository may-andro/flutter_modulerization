import 'package:component/text_widget/label_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:history/history/model/pollutant_list_item.dart';

class ItemPollutantWidget extends StatelessWidget {
  const ItemPollutantWidget({Key? key, required this.pollutantItem}) : super(key: key);

  final PollutantItem pollutantItem;
  final double dotSize = 12.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 64.0,
        right: 16,
        top: 0,
        bottom: 0,
      ),
      child: Card(
        color: pollutantItem.background,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              LabelTextWidget(
                label: pollutantItem.time,
              ),
              LabelTextWidget(
                label: pollutantItem.airQuality,
              )
            ],
          ),
        ),
      ),
    );
  }
}
