import 'dart:ui';

import 'package:domain/entity/component.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'pollutant_list_item.freezed.dart';

@freezed
class PollutantListItem with _$PollutantListItem {
  const factory PollutantListItem.headerItem(String label) = HeaderItem;

  const factory PollutantListItem.pollutantItem(
    String time,
    Color background,
    String airQuality,
    Component component,
  ) = PollutantItem;
}
