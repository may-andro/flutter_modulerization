import 'package:domain/utils/result_state/result.dart';

abstract class UseCase<Param, T> {
	Future<Result<T>> call(Param param);
}