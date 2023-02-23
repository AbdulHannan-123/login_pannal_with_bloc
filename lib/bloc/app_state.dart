import 'package:flutter/foundation.dart' show immutable;
import 'package:login_with_bloc/models.dart';

@immutable
class AppState {
  final bool isLoading;
  final LoginErrors?
      loginError; // you are not get error every time or may be have a error while login but not everytime
  final LoginHandle?
      loginHandle; //user isnt always log in many timme it log out too or not logged in yet
  final Iterable<Note>? fetchNotes; ////or may be you dont have any notes

  const AppState.empty()     // we start with this as our initial app state
      : isLoading = false,
        loginError = null,
        fetchNotes = null,
        loginHandle = null;

  const AppState(
      {required this.isLoading,
      this.loginError,
      this.loginHandle,
      this.fetchNotes});

  @override
  String toString() => {
        'isLoading': isLoading,
        'loginError': loginError,
        'loginHandle': loginHandle,
        'fetchNotes': fetchNotes,
      }.toString();
}
