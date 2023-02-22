import 'package:flutter/foundation.dart' show immutable;

@immutable 
abstract class AppAction {
  const AppAction();
}


@immutable 
class LoginAction implements AppAction {       // this say go and log the user in with these credentials
  final String email;
  final String password;

  const LoginAction({required this.email,required  this.password});

}

@immutable 
class LoadNotesAction implements AppAction{
  const LoadNotesAction();
}