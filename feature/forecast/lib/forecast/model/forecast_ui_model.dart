import 'package:flutter/material.dart';

import 'package:domain/entity/component.dart';

class ForecastUiModel {
  final Component component;
  final String airQualityIndex;
  final Color color;
  final String time;

  ForecastUiModel({
    required this.component,
    required this.airQualityIndex,
    required this.color,
    required this.time,
  });
}
