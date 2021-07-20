import 'package:common/common.dart';
import 'package:domain/entity/pollutant.dart';

class DashboardViewModel {
  DashboardViewModel(
    this.airIndexModelEntityMapper,
  );

  final AirIndexModelEntityMapper airIndexModelEntityMapper;

  String getAirQualityLabel(int airQualityIndex) => airIndexModelEntityMapper.to(airQualityIndex);

  Map<String, double> getComponentMap(Pollutant pollutant) {
    final Map<String, double> componentMap = Map<String, double>();
    componentMap.putIfAbsent("Ammonia", () => pollutant.component.ammonia);
    componentMap.putIfAbsent("Carbon Monoxide", () => pollutant.component.carbonMonoxide);
    componentMap.putIfAbsent("Coarse Particle", () => pollutant.component.coarseParticle);
    componentMap.putIfAbsent("Fine Particles", () => pollutant.component.fineParticles);
    componentMap.putIfAbsent("Nitrogen Dioxide", () => pollutant.component.nitrogenDioxide);
    componentMap.putIfAbsent("Nitrogen Monoxide", () => pollutant.component.nitrogenMonoxide);
    componentMap.putIfAbsent("Ozone", () => pollutant.component.ozone);
    return componentMap;
  }

  String getErrorMessage(Object error) {
    var message = error.toString();
    if (error is UnknownServerFailureException) {
      message = 'Unknown server exception';
    }
    if (error is ServerFailureException) {
      message = '${error.code}: ${error.message}';
    }
    if (error is ParsingException) {
      message = 'Parsing error';
    }
    return message;
  }
}
