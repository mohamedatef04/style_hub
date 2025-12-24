import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;
  const Failures({required this.errorMessage});
}

class ServerFailure extends Failures {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioExeption(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: "Connection timed out. Please try again.",
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errorMessage: "Send request timed out. Please check your network.",
        );

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errorMessage: "Receive timeout from server. Try again later.",
        );

      case DioExceptionType.badCertificate:
        return ServerFailure(
          errorMessage: "Bad SSL certificate. Cannot verify server identity.",
        );

      case DioExceptionType.badResponse:
        final response = dioException.response;
        final statusCode = response?.statusCode;
        final data = response?.data;
        return ServerFailure.fromResponse(statusCode, data);

      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request was cancelled.");

      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage:
              "Connection error. Please check your internet connection.",
        );

      case DioExceptionType.unknown:
        final message = dioException.message ?? '';
        if (message.contains('SocketException')) {
          return ServerFailure(
            errorMessage:
                "No internet connection. Please check your internet connection.",
          );
        }
        return ServerFailure(
          errorMessage: "Unexpected error occurred. Please try again later.",
        );
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 422 ||
        statusCode == 404) {
      final errors = response?['errors'];

      if (errors != null && errors is Map) {
        final errorMessages = errors.entries
            .map((e) {
              final field = e.key;
              final messages = (e.value as List).join(' ');
              return "$field: $messages";
            })
            .join('\n');

        return ServerFailure(errorMessage: errorMessages);
      }

      return ServerFailure(
        errorMessage:
            response?['message'] ??
            'Authorization error, please check your credentials.',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errorMessage: 'Internal server error, please try again later.',
      );
    } else {
      return ServerFailure(
        errorMessage:
            'Oops, something went wrong. Please try again later. (Code: $statusCode)',
      );
    }
  }
}
