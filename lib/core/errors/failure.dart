import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Time Out');
      case DioExceptionType.badCertificate:
        return ServerFailure('Certificate Error');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(dioError.message ?? 'Unexpected Error');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
          'Status $statusCode: ${response?['error']?['message'] ?? response.toString()}');
    } else if (statusCode == 404) {
      return ServerFailure('Not Found (404)');
    } else if (statusCode == 500) {
      return ServerFailure('Server Error (500)');
    } else {
      final str = response.toString();
      return ServerFailure(
          'Error $statusCode: ${str.length > 120 ? str.substring(0, 120) : str}');
    }
  }
}