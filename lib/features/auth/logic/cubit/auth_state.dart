part of 'auth_cubit.dart';

abstract class AuthState {
  void onStateReaching(BuildContext context) {}
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoggedIn extends AuthState {
  final UserModel userModel;

  AuthLoggedIn(this.userModel);

  @override
  void onStateReaching(BuildContext context) {}
}

final class AuthError extends AuthState {
  final ErrorModel error;

  AuthError(this.error);

  @override
  void onStateReaching(BuildContext context) {
    AppMessageBar.showBar(
      context,
      error.message,
      AppMessageBarType.error,
    );
  }
}
