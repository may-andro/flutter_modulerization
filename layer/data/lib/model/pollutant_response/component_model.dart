import 'package:json_annotation/json_annotation.dart';
part 'component_model.g.dart';

@JsonSerializable()
class ComponentModel {
	@JsonKey(name: 'co')
	final double carbonMonoxide;
	@JsonKey(name: 'no')
	final double nitrogenMonoxide;
	@JsonKey(name: 'no2')
	final double nitrogenDioxide;
	@JsonKey(name: 'o3')
	final double ozone;
	@JsonKey(name: 'so2')
	final double sulphurDioxide;
	@JsonKey(name: 'pm2_5')
	final double fineParticles;
	@JsonKey(name: 'pm10')
	final double coarseParticle;
	@JsonKey(name: 'nh3')
	final double ammonia;

	ComponentModel({
		required this.carbonMonoxide,
		required this.nitrogenMonoxide,
		required this.nitrogenDioxide,
		required this.ozone,
		required this.sulphurDioxide,
		required this.fineParticles,
		required this.coarseParticle,
		required this.ammonia,
	});

	factory ComponentModel.fromJson(Map<String, dynamic> json) => _$ComponentModelFromJson(json);

	Map<String, dynamic> toJson() => _$ComponentModelToJson(this);
}
