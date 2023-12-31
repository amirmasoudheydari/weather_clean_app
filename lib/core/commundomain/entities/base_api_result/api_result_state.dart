import 'package:freezed_annotation/freezed_annotation.dart';

import '../error_result_model.dart';

part 'api_result_state.freezed.dart';

@freezed
class ApiResultState<T> with _$ApiResultState<T> {
  factory ApiResultState.data({required T data}) = Data<T>;

  factory ApiResultState.error({required ErrorResultModel errorResultModel}) =
      Error<T>;
}
