import 'dart:async';

import 'package:aws_signature_v4/aws_signature_v4.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_interceptor/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(NotLoggedIn()) {
    on<LogInRequested>(_logInUser);
    on<LogInEvent>((event, emit) => emit(NotLoggedIn()));
  }

  final AuthRepository authRepository;

  FutureOr<void> _logInUser(
    LogInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Cargando());
    try {
      final res = await authRepository.logIn(
          usuario: event.usuario, contrasena: event.contrasena);

      //print('res-bloc::: ${res}');
        if (res != null) {
        emit(LoggedInSuccessfully());
      } else {
        
        emit(LoggedInFailed(res.toString()));
        emit(NotLoggedIn());
      }
    } catch (e) {
      emit(LoggedInFailed(e.toString()));
      emit(NotLoggedIn());
    }
  }
}
