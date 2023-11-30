import 'package:souq_souda/core/networks/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

class LocalDatabaseException implements Exception {
  final ErrorMessageModel errorMessageModel;

  LocalDatabaseException({required this.errorMessageModel});
}
