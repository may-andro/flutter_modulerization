import 'package:common/common.dart';
import 'package:forecast/forecast/model/forecast_list_item.dart';

class ForecastItemListMapper
    extends UnidirectionalObjectMapper<Map<ForecastItem, List<ForecastItem>>, List<ForecastItem>> {
  @override
  List<ForecastItem> to(Map<ForecastItem, List<ForecastItem>> map) {
    final List<ForecastItem> forecastList = List.empty();
    map.forEach((key, value) {
      forecastList.add(key);
      forecastList.addAll(value);
    });

    return forecastList;
  }
}
