import 'package:data/mapper/pollutant_response/component_model_entity_mapper.dart';
import 'package:data/mapper/pollutant_response/pollutant_model_entity_mapper.dart';
import 'package:data/mapper/pollutant_response/pollutant_response_model_entity_mapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final componentModelEntityMapperProvider = Provider<ComponentModelEntityMapper>((ref) => ComponentModelEntityMapper());

final pollutantModelEntityMapperProvider = Provider<PollutantModelEntityMapper>((ref) {
  final componentModelEntityMapper = ref.read<ComponentModelEntityMapper>(componentModelEntityMapperProvider);
  return PollutantModelEntityMapper(componentModelEntityMapper);
});

final pollutantResponseModelEntityMapperProvider = Provider<PollutantResponseModelEntityMapper>((ref) {
  final pollutantModelEntityMapper = ref.read<PollutantModelEntityMapper>(pollutantModelEntityMapperProvider);
  return PollutantResponseModelEntityMapper(pollutantModelEntityMapper);
});
