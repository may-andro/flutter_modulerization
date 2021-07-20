import 'package:json_annotation/json_annotation.dart';

part 'aqi_model.g.dart';

@JsonSerializable()
class AqiModel {
	@JsonKey(name: 'aqi')
	final int aqi;

	AqiModel({
		required this.aqi,
	});

	factory AqiModel.fromJson(Map<String, dynamic> json) => _$AqiModelFromJson(json);

	Map<String, dynamic> toJson() => _$AqiModelToJson(this);
}

