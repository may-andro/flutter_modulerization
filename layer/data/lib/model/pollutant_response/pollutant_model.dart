import 'package:data/model/pollutant_response/aqi_model.dart';
import 'package:data/model/pollutant_response/component_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pollutant_model.g.dart';

@JsonSerializable()
class PollutantModel {
	@JsonKey(name: 'dt')
	final int date;
	@JsonKey(name: 'main')
	final AqiModel main;
	@JsonKey(name: 'components')
	final ComponentModel components;

	PollutantModel({
		required this.date,
		required this.main,
		required this.components,
	});

	factory PollutantModel.fromJson(Map<String, dynamic> json) => _$PollutantModelFromJson(json);

	Map<String, dynamic> toJson() => _$PollutantModelToJson(this);
}

