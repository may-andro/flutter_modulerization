import 'package:common/common.dart';
import 'package:domain/entity/pollutant.dart';
import 'package:collection/collection.dart';
import 'package:forecast/forecast/model/forecast_ui_model.dart';

class ForecastUiModelMapper extends UnidirectionalObjectMapper<List<Pollutant>, Map<String, List<ForecastUiModel>>> {
  ForecastUiModelMapper(
    this.airIndexModelEntityMapper,
    this.airIndexColorModelEntityMapper,
  );

  final AirIndexColorModelEntityMapper airIndexColorModelEntityMapper;
  final AirIndexModelEntityMapper airIndexModelEntityMapper;

  @override
  Map<String, List<ForecastUiModel>> to(List<Pollutant> list) {
    final datePollutantMap = groupBy(list, (item) {
      return DateTime.fromMillisecondsSinceEpoch((item as Pollutant).date * 1000).getFormattedDate(FORMAT_YYYY_MM_DD);
    });
    final transformedMap = datePollutantMap.map((key, value) {
      final forecastUiModelList = value.map((pollutant) {
        return ForecastUiModel(
          component: pollutant.component,
          airQualityIndex: airIndexModelEntityMapper.to(pollutant.aqi),
          color: airIndexColorModelEntityMapper.to(pollutant.aqi),
          time: DateTime.fromMillisecondsSinceEpoch(pollutant.date * 1000).getFormattedDate(FORMAT_HH_MM),
        );
      }).toList();
      return MapEntry(key, forecastUiModelList);
    });
    return transformedMap;
  }
}
