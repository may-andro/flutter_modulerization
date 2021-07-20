import 'package:domain/entity/user_location.dart';
import 'package:domain/repository/location/location_repository.dart';

class GetLocationUseCase {
  GetLocationUseCase(this._locationRepository);

  final LocationRepository _locationRepository;

  Future<UserLocation> call() async {
    return await _locationRepository.getCurrentLocation();
  }
}
