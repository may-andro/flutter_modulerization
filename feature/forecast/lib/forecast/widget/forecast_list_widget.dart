import 'package:flutter/material.dart';
import 'package:forecast/forecast/model/forecast_list_item.dart';
import 'package:forecast/forecast/widget/forecast_item_widget.dart';

class ForecastListWidget extends StatelessWidget {
  const ForecastListWidget({
    Key? key,
    required this.forecastList,
  }) : super(key: key);

  final List<ForecastItem> forecastList;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                height: 1,
                color: Colors.transparent,
              ),
          padding: EdgeInsets.symmetric(horizontal: 12),
          itemCount: forecastList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => {},
              child: ForecastItemWidget(forecastItem: forecastList[index]),
            );
          }),
    );
  }
}
