import 'package:component/text_widget/label_text_widget.dart';
import 'package:component/text_widget/sub_title_text_widget.dart';
import 'package:component/text_widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:forecast/forecast/model/forecast_list_item.dart';

class ForecastItemWidget extends StatelessWidget {
  const ForecastItemWidget({Key? key, required this.forecastItem}) : super(key: key);

  final ForecastItem forecastItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: forecastItem.background,
      child: ListTile(
        leading: Icon(
          Icons.access_time,
          size: 36,
        ),
        title: TitleTextWidget(
          label: forecastItem.airQuality,
        ),
        subtitle: SubTitleTextWidget(
          value: forecastItem.time,
        ),
      ),
    );
  }
}
