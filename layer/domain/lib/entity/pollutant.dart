import 'package:domain/entity/component.dart';

class Pollutant {
  Pollutant({
    required this.date,
    required this.aqi,
    required this.component,
  });

  final int date;
  final int aqi;
  final Component component;
}
