import 'package:common/common.dart';
import 'package:data/mapper/pollutant_response/pollutant_model_entity_mapper.dart';
import 'package:data/model/pollutant_response/pollutant_response_model.dart';
import 'package:domain/entity/pollutant.dart';

class PollutantResponseModelEntityMapper implements ModelEntityMapper<PollutantResponseModel, List<Pollutant>> {
  PollutantResponseModelEntityMapper(this.pollutantModelEntityMapper);

  final PollutantModelEntityMapper pollutantModelEntityMapper;

  @override
  PollutantResponseModel mapFromEntityToModel(List<Pollutant> entity) => PollutantResponseModel(
      pollutantList: entity.map((e) => pollutantModelEntityMapper.mapFromEntityToModel(e)).toList());

  @override
  List<Pollutant> mapFromModelToEntity(PollutantResponseModel model) =>
      model.pollutantList.map((e) => pollutantModelEntityMapper.mapFromModelToEntity(e)).toList();
}
