import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  bool isPhoneNumber() {
    return RegExp(r"^\+?0[0-9]{10}$").hasMatch(this);
  }

  bool isEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

extension ExceptionExtensions on Exception {
  String toUserFriendlyMessage() {
    if (this is FirebaseAuthException) {
      return (this as FirebaseAuthException).message!;
    } else if (this is FirebaseException) {
      return (this as FirebaseException).message!;
    } else {
      return this.toString().replaceAll('Exception: ', '');
    }
  }
}
