enum ErrorType { firebase, validation, auth, unknown }

class ErrorModel {
  final String message;
  final ErrorType type;

  ErrorModel({required this.message, required this.type});
}
