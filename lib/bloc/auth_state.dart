part of 'auth_bloc.dart';

class AuthState {
  final String email;
  final String password;
  final bool isAuthenticated;
  final String errormessage;

  const AuthState(
      {this.email = "",
      this.password = "",
      this.isAuthenticated = false,
      this.errormessage = ""});

  AuthState copyWith({
    String? email,
    String? password,
    bool? isAuthenticated,
    String? errormessage,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      errormessage: errormessage ?? this.errormessage,
    );
  }
}
