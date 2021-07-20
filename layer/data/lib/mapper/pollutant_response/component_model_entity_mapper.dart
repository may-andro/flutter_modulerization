import 'package:common/common.dart';
import 'package:data/model/pollutant_response/component_model.dart';
import 'package:domain/entity/component.dart';

class ComponentModelEntityMapper implements ModelEntityMapper<ComponentModel, Component> {
  @override
  ComponentModel mapFromEntityToModel(Component entity) => ComponentModel(
        carbonMonoxide: entity.carbonMonoxide,
        nitrogenMonoxide: entity.nitrogenMonoxide,
        nitrogenDioxide: entity.nitrogenDioxide,
        ozone: entity.ozone,
        sulphurDioxide: entity.sulphurDioxide,
        fineParticles: entity.fineParticles,
        coarseParticle: entity.coarseParticle,
        ammonia: entity.ammonia,
      );

  @override
  Component mapFromModelToEntity(ComponentModel model) => Component(
        carbonMonoxide: model.carbonMonoxide,
        nitrogenMonoxide: model.nitrogenMonoxide,
        nitrogenDioxide: model.nitrogenDioxide,
        ozone: model.ozone,
        sulphurDioxide: model.sulphurDioxide,
        fineParticles: model.fineParticles,
        coarseParticle: model.coarseParticle,
        ammonia: model.ammonia,
      );
}
