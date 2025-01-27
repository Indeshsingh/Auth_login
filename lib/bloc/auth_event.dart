part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthSignupEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignupEvent(this.email, this.password);
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent(this.email, this.password);
}

class AuthLogoutEvent extends AuthEvent {}
