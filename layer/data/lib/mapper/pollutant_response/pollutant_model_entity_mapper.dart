import 'package:common/common.dart';
import 'package:data/mapper/pollutant_response/component_model_entity_mapper.dart';
import 'package:data/model/pollutant_response/aqi_model.dart';
import 'package:data/model/pollutant_response/pollutant_model.dart';
import 'package:domain/entity/pollutant.dart';

class PollutantModelEntityMapper implements ModelEntityMapper<PollutantModel, Pollutant> {
  PollutantModelEntityMapper(this.componentModelEntityMapper);

  final ComponentModelEntityMapper componentModelEntityMapper;

  @override
  PollutantModel mapFromEntityToModel(Pollutant entity) => PollutantModel(
        date: entity.date,
        components: componentModelEntityMapper.mapFromEntityToModel(entity.component),
        main: AqiModel(aqi: entity.aqi),
      );

  @override
  Pollutant mapFromModelToEntity(PollutantModel model) => Pollutant(
        date: model.date,
        component: componentModelEntityMapper.mapFromModelToEntity(model.components),
        aqi: model.main.aqi,
      );
}
