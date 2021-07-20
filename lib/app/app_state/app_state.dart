import 'package:common/common.dart';
import 'package:domain/entity/user_location.dart';
import 'package:domain/usecase/location/get_location_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppGlobalState {
  final UserLocation? _userLocation;

  AppGlobalState(this._userLocation);

  AppGlobalState copy({
    UserLocation? newUserLocation,
  }) {
    return AppGlobalState(
      newUserLocation ?? this._userLocation,
    );
  }

  UserLocation? getCurrentLocation() {
  	return _userLocation;
  }

}

class AppGlobalStateNotifier extends StateNotifier<AppGlobalState> {
  final logger = AppLogger.setLogTag('AppGlobalStateNotifier');

  AppGlobalStateNotifier(this.getLocationUseCase) : super(AppGlobalState(null));

  final GetLocationUseCase getLocationUseCase;

  Future<UserLocation> getCurrentLocation() async {
    AppLogger.logDebug('getCurrentLocation', logger: logger);

    final userLocation = await getLocationUseCase.call();
    state = state.copy(newUserLocation: userLocation);
    return userLocation;
  }
}
