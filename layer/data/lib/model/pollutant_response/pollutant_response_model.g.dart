// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollutant_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollutantResponseModel _$PollutantResponseModelFromJson(
    Map<String, dynamic> json) {
  return PollutantResponseModel(
    pollutantList: (json['list'] as List<dynamic>)
        .map((e) => PollutantModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PollutantResponseModelToJson(
        PollutantResponseModel instance) =>
    <String, dynamic>{
      'list': instance.pollutantList,
    };
