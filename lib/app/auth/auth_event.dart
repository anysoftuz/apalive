part of 'auth_bloc.dart';

sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;
  final VoidCallback onError;

  LoginEvent({
    required this.username,
    required this.password,
    required this.onError,
  });
}

class GetMeEvent extends AuthEvent {}

class CheckUserEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}

class RefreshToken extends AuthEvent {}
