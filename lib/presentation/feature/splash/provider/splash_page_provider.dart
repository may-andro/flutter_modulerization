import 'package:data/di/usecase_provider.dart';
import 'package:domain/entity/user_location.dart';
import 'package:domain/usecase/location/get_location_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userLocationProvider = FutureProvider<UserLocation>((ref) async {
  final getLocationUseCase = ref.read<GetLocationUseCase>(getLocationUseCaseProvider);
  return await getLocationUseCase.call();
});
