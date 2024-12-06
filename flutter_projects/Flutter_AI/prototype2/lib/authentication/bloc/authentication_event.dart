part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent {
  final String username;
  final String password;

  const LoginEvent(this.username, this.password);

  List<Object> get props => [username, password];
}
