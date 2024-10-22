import 'package:bloc/bloc.dart';
import 'package:crm/core/helpers/extensions.dart';
import 'package:crm/core/helpers/message_bar.dart';
import 'package:crm/core/models/error_model.dart';
import 'package:crm/core/networking/error_handler.dart';
import 'package:crm/features/auth/data/repos/auth_repo.dart';
import 'package:crm/features/auth/data/user_model.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());

  final AuthRepo _authRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    if (!validate()) {
      emit(AuthError(_getValidationError()));
      clearControllers();
      return;
    }
    emit(AuthLoading());
    final authUser =
        await _authRepo.login(emailController.text, passwordController.text);
    authUser.fold(
      (firebaseException) => emit(AuthError(ErrorHandler.handleError(
        firebaseException,
        type: ErrorType.firebase,
      ))),
      (userModel) => emit(AuthLoggedIn(userModel)),
    );
  }

  bool validate() {
    if (emailController.text.trim().isEmpty ||
        !emailController.text.isEmail() ||
        passwordController.text.trim().isEmpty ||
        passwordController.text.length < 6) {
      return false;
    } else {
      return true;
    }
  }

  String getErrorMessage() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      return 'Email or password cannot be empty!';
    } else if (passwordController.text.length < 6) {
      return 'Password must be at least 6 characters long!';
    } else if (!emailController.text.isEmail()) {
      return 'Email is not valid!';
    } else {
      return 'Something went wrong!';
    }
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  ErrorModel _getValidationError() {
    return ErrorHandler.handleError(getErrorMessage(),
        type: ErrorType.validation);
  }
}
