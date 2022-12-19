part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LogInRequested extends AuthEvent {
  LogInRequested(this.usuario, this.contrasena);
  final String? usuario;
  final String? contrasena;
}

class LogInEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}

class ResigterRequested extends AuthEvent {
  ResigterRequested(this.user, this.email, this.contrasena);
  final String user;
  final String email;
  final String contrasena;
}

class LogOutRequested extends AuthEvent {}
