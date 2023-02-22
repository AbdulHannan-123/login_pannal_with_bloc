import 'package:flutter/foundation.dart' show immutable;
import 'package:login_with_bloc/models.dart';

@immutable
abstract class NoteApiProtocol {
  const NoteApiProtocol();
  Future<Iterable<Note>?> getNote({required  LoginHandle loginhandle});
  
}

@immutable
class NotesApi implements NoteApiProtocol {
  @override
  Future<Iterable<Note>?> getNote({required  LoginHandle loginhandle}) =>
  Future.delayed(
    const Duration(seconds: 2),
    () => loginhandle == const LoginHandle.foobar() ? mockNotes : null,
    );
  
}