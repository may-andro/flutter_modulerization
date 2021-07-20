import 'package:domain/entity/user_location.dart';

abstract class LocationRepository {
  Future<UserLocation> getCurrentLocation();
}
