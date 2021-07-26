import 'package:common/common.dart';
import 'package:domain/entity/pollutant.dart';
import 'package:collection/collection.dart';
import 'package:forecast/forecast/model/forecast_list_item.dart';

final _logger = AppLogger.setLogTag('ForecastItemMapMapper');

class ForecastItemMapMapper extends UnidirectionalObjectMapper<List<Pollutant>, Map<DateTime, List<ForecastItem>>> {
  ForecastItemMapMapper(
    this.airIndexModelEntityMapper,
    this.airIndexColorModelEntityMapper,
  );

  final AirIndexColorModelEntityMapper airIndexColorModelEntityMapper;
  final AirIndexModelEntityMapper airIndexModelEntityMapper;

  @override
  Map<DateTime, List<ForecastItem>> to(List<Pollutant> pollutantList) {
    final datePollutantMap = groupBy(pollutantList, (item) {
      return DateTime.fromMillisecondsSinceEpoch((item as Pollutant).date * 1000).getFormattedDate(FORMAT_YYYY_MM_DD);
    });
    final transformedMap = datePollutantMap.map((key, value) {
      final forecastItemList = value.map((pollutant) {
        return ForecastItem(
          component: pollutant.component,
          airQuality: airIndexModelEntityMapper.to(pollutant.aqi),
          background: airIndexColorModelEntityMapper.to(pollutant.aqi),
          time: DateTime.fromMillisecondsSinceEpoch(pollutant.date * 1000).getFormattedDate(FORMAT_HH_MM),
        );
      }).toList();
      return MapEntry(key.getFormattedDate()!, forecastItemList);
    });
    return transformedMap;
  }
}
