part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {
  const AuthenticationState();

  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User user;

  const Authenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthError extends AuthenticationState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}
