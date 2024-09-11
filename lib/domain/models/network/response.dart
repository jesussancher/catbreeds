class Response<T> {
  final ResponseSuccess<T>? success;
  final ResponseError? error;
  const Response({
    this.success,
    this.error,
  });

  bool get succeeded => success != null;
}

class ResponseError {
  final int? statusCode;
  final String? errorMessage;
  const ResponseError({
    this.statusCode,
    this.errorMessage,
  });
}

class ResponseSuccess<T> {
  final int? statusCode;
  final Map<String, dynamic>? originalData;
  final T? data;
  ResponseSuccess({
    this.statusCode,
    this.originalData,
    this.data,
  });

  factory ResponseSuccess.fromResponse({
    T? data,
    ResponseSuccess? response,
  }) {
    return ResponseSuccess(
      statusCode: response?.statusCode,
      originalData: response?.originalData,
      data: data,
    );
  }
}
