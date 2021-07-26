import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forecast/forecast/model/forecast_list_item.dart';
import 'package:forecast/forecast/provider/forecast_page_provider.dart';
import 'package:forecast/forecast/widget/forecast_calender_widget.dart';
import 'package:forecast/forecast/widget/forecast_list_widget.dart';

final _logger = AppLogger.setLogTag('ForecastCalenderListWidget');

class ForecastCalenderListWidget extends StatelessWidget {
  const ForecastCalenderListWidget({
    Key? key,
    required this.forecastMap,
  }) : super(key: key);

  final Map<DateTime, List<ForecastItem>> forecastMap;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final calenderListSelectionState = watch(calenderListSelectionStateNotifierProvider);
      final selectedDate = calenderListSelectionState.selectedDate ?? forecastMap.keys.first;
      return Column(
        children: [
          _buildCalenderWidget(context, selectedDate),
          Expanded(child: _buildForecastList(forecastMap[selectedDate] ?? forecastMap.values.first)),
        ],
      );
    });
  }

  Widget _buildForecastList(List<ForecastItem> forecastList) {
    return ForecastListWidget(
      forecastList: forecastList,
    );
  }

  Widget _buildCalenderWidget(BuildContext context, DateTime selectedDate) {
    return CalenderWidget(
      selectedDate: selectedDate,
      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
	      context.read(calenderListSelectionStateNotifierProvider.notifier).selectDate(DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 0, 0, 0, 0, 0));
      },
      forecastMap: forecastMap,
    );
  }
}
