class ResponseError {
  final int? statusCode;
  final String? errorMessage;
  const ResponseError({
    this.statusCode,
    this.errorMessage,
  });
}

class ResponseSuccess {
  final int? statusCode;
  final Map<String, dynamic>? originalData;
  ResponseSuccess({
    this.statusCode,
    this.originalData,
  });
}
