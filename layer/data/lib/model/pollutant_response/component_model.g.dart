// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentModel _$ComponentModelFromJson(Map<String, dynamic> json) {
  return ComponentModel(
    carbonMonoxide: (json['co'] as num).toDouble(),
    nitrogenMonoxide: (json['no'] as num).toDouble(),
    nitrogenDioxide: (json['no2'] as num).toDouble(),
    ozone: (json['o3'] as num).toDouble(),
    sulphurDioxide: (json['so2'] as num).toDouble(),
    fineParticles: (json['pm2_5'] as num).toDouble(),
    coarseParticle: (json['pm10'] as num).toDouble(),
    ammonia: (json['nh3'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ComponentModelToJson(ComponentModel instance) =>
    <String, dynamic>{
      'co': instance.carbonMonoxide,
      'no': instance.nitrogenMonoxide,
      'no2': instance.nitrogenDioxide,
      'o3': instance.ozone,
      'so2': instance.sulphurDioxide,
      'pm2_5': instance.fineParticles,
      'pm10': instance.coarseParticle,
      'nh3': instance.ammonia,
    };
