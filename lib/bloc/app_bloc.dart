import 'package:bloc/bloc.dart';
import 'package:login_with_bloc/api/login_api.dart';
import 'package:login_with_bloc/api/notes_api.dart';
import 'package:login_with_bloc/bloc/actions.dart';
import 'package:login_with_bloc/bloc/app_state.dart';
import 'package:login_with_bloc/models.dart';

class AppBloc extends Bloc<AppAction, AppState> {
  final LoginApiProtocol loginapi;
  final NoteApiProtocol notesapi;

  AppBloc({
    required this.loginapi,
    required this.notesapi,
  }) : super(const AppState.empty()) {
    // is the initial state of our bloc
    on<LoginAction>((event, emit) async {
      // start loading
      emit(
        const AppState(
            isLoading: true,
            fetchNotes: null,
            loginError: null,
            loginHandle: null),
      );
      // log the user in
      final loginhandle = await LoginApi.instance().login(
        email: event.email,
        password: event.password,
      );
      emit(AppState(
          isLoading: false,
          fetchNotes: null,
          loginError: loginhandle == null ? LoginErrors.invlidHandle : null,
          loginHandle: loginhandle));
    });

    on<LoadNotesAction>(
      (event, emit) async {
        //start loading
        emit(
           AppState(
            isLoading: true,
            fetchNotes: null,
            loginError: null,
            loginHandle: state.loginHandle,    // the stae is showing that the bloc is holding the previous state
          ),
        );
        // get the login handle
        final loginhandle = state.loginHandle;
        if (loginhandle != const LoginHandle.foobar()) {  // invalid login handle can not fetch null
          emit(
           AppState(
            isLoading: false,
            fetchNotes: null,
            loginError: LoginErrors.invlidHandle,
            loginHandle: loginhandle ,    
          ),
        );
        return;
        }
          // we have valid login handle and want to fetch notes

          final notes = await notesapi.getNote(loginhandle: loginhandle!,);
          emit(
           AppState(
            isLoading: false,
            fetchNotes: notes,
            loginError: null,
            loginHandle: loginhandle ,    
          ),
        );
      
      },
    );
  }
}
