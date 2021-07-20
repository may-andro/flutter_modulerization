import 'package:common/common.dart';
import 'package:data/location/location_client.dart';
import 'package:domain/repository/location/location_repository.dart';
import 'package:domain/entity/user_location.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationClient _locationClient;

  LocationRepositoryImpl(this._locationClient);

  @override
  Future<UserLocation> getCurrentLocation() async {
    final _serviceEnabled = await _locationClient.requestService();

    if (!_serviceEnabled) throw LocationServiceNotFoundException();

    final _permissionGranted = await _locationClient.requestPermission();

    if (!_permissionGranted) throw LocationPermissionDeniedException();

    return await _locationClient.getUserLocation();
  }
}
