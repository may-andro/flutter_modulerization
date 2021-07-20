import 'package:data/location/location_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final locationProvider = Provider<Location>((ref) => Location());

final locationClientProvider = Provider<LocationClient>((ref) {
  final _location = ref.read(locationProvider);
  return LocationClient(_location);
});
