import 'package:data/model/pollutant_response/pollutant_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pollutant_response_model.g.dart';

@JsonSerializable()
class PollutantResponseModel {
	PollutantResponseModel({
		required this.pollutantList,
	});

	@JsonKey(name: 'list')
	final List<PollutantModel> pollutantList;

	factory PollutantResponseModel.fromJson(Map<String, dynamic> json) => _$PollutantResponseModelFromJson(json);

	Map<String, dynamic> toJson() => _$PollutantResponseModelToJson(this);
}
