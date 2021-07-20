import 'package:domain/entity/user_location.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as Location;
import 'package:common/common.dart';

final logger = AppLogger.setLogTag('LocationClient');

class LocationClient {
  final Location.Location _location;

  LocationClient(this._location);

  Future<bool> requestService() async {
    bool _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      return _serviceEnabled;
    }

    return _serviceEnabled;
  }

  Future<bool> requestPermission() async {
    Location.PermissionStatus _permissionStatus = await _location.hasPermission();
    if (_permissionStatus == Location.PermissionStatus.denied) {
      _permissionStatus = await _location.requestPermission();
      return _permissionStatus != Location.PermissionStatus.granted;
    }

    return _permissionStatus == Location.PermissionStatus.granted;
  }

  Future<UserLocation> getUserLocation() async {
    Location.LocationData _locationData = await _location.getLocation();
    if (_locationData.latitude == null || _locationData.longitude == null) throw LocationNotFoundException();

    if (_locationData.latitude == 0.0 && _locationData.longitude == 0.0) throw UnknownLocationException();

    final cityName = await _getAddress(
      _locationData.latitude!,
      _locationData.longitude!,
    );

    if (cityName == null) throw UnknownLocationException();

    return UserLocation(
      latitude: _locationData.latitude!,
      longitude: _locationData.longitude!,
      cityName: cityName,
    );
  }

  Future<String?> _getAddress(double lat, double lang) async {
    List<Placemark> placeMarkList = await placemarkFromCoordinates(lat, lang);
    AppLogger.logDebug('_getAddress: ${placeMarkList.first.toString()}', logger: logger);
    return placeMarkList.first.locality ??
        placeMarkList.first.subAdministrativeArea ??
        placeMarkList.first.administrativeArea ??
        null;
  }
}
