import 'package:component/text_widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:history/history/model/pollutant_list_item.dart';

class ItemDateHeaderWidget extends StatelessWidget {
  const ItemDateHeaderWidget({Key? key, required this.headerItem}) : super(key: key);
  final HeaderItem headerItem;
  final double dotSize = 12.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 35.0,
            right: 16,
            top: MediaQuery.of(context).size.shortestSide * 0.03,
            bottom: MediaQuery.of(context).size.shortestSide * 0.03,
          ),
          child: Container(
            height: dotSize,
            width: dotSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: TitleTextWidget(
            label: headerItem.label,
          ),
        ),
      ],
    );
  }
}
