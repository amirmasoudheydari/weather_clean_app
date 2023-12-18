import 'package:equatable/equatable.dart';

class ErrorResultModel extends Equatable {
  final int? statusCode;
  final String? message;

  const ErrorResultModel({required this.statusCode, required this.message});

  @override
  List<Object?> get props => [statusCode, message];
}
