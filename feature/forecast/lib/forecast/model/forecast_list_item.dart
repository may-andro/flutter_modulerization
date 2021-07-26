import 'package:flutter/material.dart';
import 'package:domain/entity/component.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_list_item.freezed.dart';

@freezed
class ForecastListItem with _$ForecastListItem {
  const factory ForecastListItem.headerItem({required DateTime date}) = HeaderItem;

  const factory ForecastListItem.forecastItem({
    required String time,
    required Color background,
    required String airQuality,
    required Component component,
  }) = ForecastItem;
}
