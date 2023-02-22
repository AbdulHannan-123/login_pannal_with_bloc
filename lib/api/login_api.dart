import 'dart:ffi';

import 'package:flutter/foundation.dart' show immutable;
import 'package:login_with_bloc/models.dart';

@immutable
abstract class LoginApiProtocol {
  const LoginApiProtocol();

  Future<LoginHandle?> login({
    required String email,
    required String password,
  });
}

@immutable
class LoginApi implements LoginApiProtocol {
  //// implementing the singleton pattren
  const LoginApi._sharedInstance(); // its like the initializer kind of... constructor
  static const LoginApi _shared = LoginApi._sharedInstance(); //
  factory LoginApi.instance() => _shared;

  @override
  Future<LoginHandle?> login({
    required String email,
    required String password,
  }) =>
      Future.delayed(const Duration(seconds: 2),
              () => email == 'foo#bar.com' && password == 'foobar')
          .then((isLoggedin) => isLoggedin ? LoginHandle.foobar() : null);
}
