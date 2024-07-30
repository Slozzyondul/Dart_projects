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
      : super(AuthenticationInitial()) {
    @override
    Stream<AuthenticationState> mapEventToState(
        AuthenticationEvent event) async* {
      if (event is LoginEvent) {
        yield AuthenticationLoading();
        try {
          final user = await authenticationRepository.login(
              event.username, event.password);
          yield Authenticated(user: user);
        } catch (e) {
          yield AuthError(message: e.toString());
        }
      }
      // Handle other events...
    }
  }
}
