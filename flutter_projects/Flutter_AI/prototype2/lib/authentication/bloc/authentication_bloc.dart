import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:prototype2/models/user.dart';
import 'package:prototype2/repositories/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc({required this.authenticationRepository})
      : super(Unauthenticated()) {
    on<LoginEvent>(_onLoginEvent);
    // Add other event handlers here
  }

  Future<void> _onLoginEvent(
      LoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final user =
          await authenticationRepository.login(event.username, event.password);
      emit(Authenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}

// class AuthenticationBloc
//     extends Bloc<AuthenticationEvent, AuthenticationState> {
//   final AuthenticationRepository authenticationRepository;

//   AuthenticationBloc({required this.authenticationRepository})
//       : super(Unauthenticated()) {
//     on<LoginEvent>(_onLoginEvent);
//     @override
//     Stream<AuthenticationState> mapEventToState(
//         AuthenticationEvent event) async* {
//       if (event is LoginEvent) {
//         yield AuthenticationLoading();
//         try {
//           final user = await authenticationRepository.login(
//               event.username, event.password);
//           yield Authenticated(user: user);
//         } catch (e) {
//           yield AuthError(message: e.toString());
//         }
//       }
//       // Handle other events...
//     }
//   }
// }

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final AuthenticationRepository authenticationRepository;

//   LoginBloc({required this.authenticationRepository}) : super(LoginInitial()) {
//     on<LoginEvent>(_onLoginEvent);
//   }

//   Future<void> _onLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
//     emit(LoginLoading());
//     try {
//       final user =
//           await authenticationRepository.login(event.username, event.password);
//       emit(LoginSuccess(user: user));
//     } catch (error) {
//       emit(LoginFailure(error: error.toString()));
//     }
//   }
// }
