import 'package:component/table/pollutant_table/model/component_table_item.dart';
import 'package:domain/entity/component.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:history/mapper/component_table_list_mapper.dart';

final provideComponentTableListMapper = Provider<ComponentTableListMapper>((ref) => ComponentTableListMapper());

final provideComponentTableList = FutureProvider.family<List<ComponentTableItem>, Component>((ref, param) async {
  final componentTableListMapper = ref.read<ComponentTableListMapper>(provideComponentTableListMapper);
  return await Future.value(componentTableListMapper.to(param));
});
