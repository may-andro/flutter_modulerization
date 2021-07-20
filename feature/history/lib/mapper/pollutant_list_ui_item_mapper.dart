import 'package:common/common.dart';
import 'package:domain/entity/pollutant.dart';
import 'package:collection/collection.dart';
import 'package:history/history/model/pollutant_list_item.dart';

class PollutantListUiItemMapper extends UnidirectionalObjectMapper<List<Pollutant>, List<PollutantListItem>> {
  PollutantListUiItemMapper(
    this.airIndexModelEntityMapper,
    this.airIndexColorModelEntityMapper,
  );

  final AirIndexColorModelEntityMapper airIndexColorModelEntityMapper;
  final AirIndexModelEntityMapper airIndexModelEntityMapper;

  @override
  List<PollutantListItem> to(List<Pollutant> list) {
    final List<PollutantListItem> pollutantItemList = [];
    final datePollutantMap = groupBy(list, (item) {
      return DateTime.fromMillisecondsSinceEpoch((item as Pollutant).date * 1000).getFormattedDate(FORMAT_YYYY_MM_DD);
    });

    datePollutantMap.forEach((key, value) {
      final header = PollutantListItem.headerItem(key);
      final pollutantList = value.map((item) {
        return PollutantListItem.pollutantItem(
          DateTime.fromMillisecondsSinceEpoch(item.date * 1000).getFormattedDate(FORMAT_HH_MM),
          airIndexColorModelEntityMapper.to(item.aqi),
          airIndexModelEntityMapper.to(item.aqi),
          item.component,
        );
      }).toList();
      pollutantItemList.add(header);
      pollutantItemList.addAll(pollutantList);
    });

    return pollutantItemList;
  }
}
