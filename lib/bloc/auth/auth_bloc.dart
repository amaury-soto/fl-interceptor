import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_interceptor/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(NotLoggedIn()) {
    on<LogInRequested>(_logInUser);
    on<LogInEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final AuthRepository authRepository;

  FutureOr<void> _logInUser(
    LogInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    try {
      final res = await authRepository.logIn(
          usuario: event.usuario, contrasena: event.contrasena);
      print('res:::: $res');
      if (res['estado'] == true) {
        print('HEREEEEEEE');
        emit(LoggedInSuccessfully());
        /*   await locator.setUserToken(userToken: res["token"]).then((value) {
            emit(LoggedInSuccessfully());
          }); */
      } else {
        emit(LoggedInFailed(res['estado']));
        emit(NotLoggedIn());
      }
    } catch (e) {
      emit(LoggedInFailed(e.toString()));
      emit(NotLoggedIn());
    }
  }
}
