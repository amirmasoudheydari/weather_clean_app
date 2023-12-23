class CustomConnectionException implements Exception {
  final int? exceptionCode;
  final String? exceptionMessage;

  const CustomConnectionException(
      {required this.exceptionCode, required this.exceptionMessage});
}
