import 'package:crm/core/models/error_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ErrorHandler {
  static ErrorModel handleError(dynamic error, {ErrorType? type}) {
    if (error is FirebaseAuthException) {
      return _getFirebaseAuthException(error);
    } else if (error is FirebaseException) {
      return _getFirebaseFirestoreException(error);
    } else {
      return ErrorModel(
        message: error.toString(),
        type: type ?? ErrorType.unknown,
      );
    }
  }

  static ErrorModel _getFirebaseAuthException(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return ErrorModel(
            message: 'Invalid email address', type: ErrorType.auth);
      case 'invalid-credential':
        return ErrorModel(
            message: 'Username or password is incorrect', type: ErrorType.auth);
      case 'user-not-found':
        return ErrorModel(message: 'User not found', type: ErrorType.auth);
      case 'operation-not-allowed':
        return ErrorModel(
            message: 'Operation not allowed', type: ErrorType.auth);
      case 'invalid-password':
        return ErrorModel(
            message:
                'Invalid password, it must be a string with at least six characters.',
            type: ErrorType.auth);
      case 'internal-error':
        return ErrorModel(
            message: 'Internal error occurred', type: ErrorType.auth);
      case 'too-many-requests':
        return ErrorModel(
            message: 'The number of requests exceeds the maximum allowed.',
            type: ErrorType.auth);
      default:
        return ErrorModel(
            message: 'Something went wrong with auth', type: ErrorType.auth);
    }
  }

  static ErrorModel _getFirebaseFirestoreException(FirebaseException error) {
    switch (error.code) {
      case 'ALREADY_EXISTS':
        return ErrorModel(
            message: 'This record already exists', type: ErrorType.firebase);
      case 'INTERNAL':
        return ErrorModel(
            message: 'Internal error occurred', type: ErrorType.firebase);
      case 'NOT_FOUND':
        return ErrorModel(
            message: 'The requested record was not found',
            type: ErrorType.firebase);
      default:
        return ErrorModel(
            message: 'Something went wrong with database',
            type: ErrorType.firebase);
    }
  }
}
