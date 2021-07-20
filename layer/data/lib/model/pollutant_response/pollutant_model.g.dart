// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollutant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollutantModel _$PollutantModelFromJson(Map<String, dynamic> json) {
  return PollutantModel(
    date: json['dt'] as int,
    main: AqiModel.fromJson(json['main'] as Map<String, dynamic>),
    components:
        ComponentModel.fromJson(json['components'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PollutantModelToJson(PollutantModel instance) =>
    <String, dynamic>{
      'dt': instance.date,
      'main': instance.main,
      'components': instance.components,
    };
