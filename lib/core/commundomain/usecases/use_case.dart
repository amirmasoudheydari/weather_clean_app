import 'package:equatable/equatable.dart';
import 'package:weather_clean_app/core/commundomain/entities/api_result_model.dart';

abstract class UseCase<Type, Params> {
  Future<ApiResultModel<Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
