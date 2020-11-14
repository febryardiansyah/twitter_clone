import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:twitter_clone/bloc/auth_bloc/auth_bloc.dart';
import 'package:twitter_clone/helpers/connectivity_check.dart';
import 'package:twitter_clone/locator.dart';
import 'package:twitter_clone/repositories/auth_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  var _repo = getIt.get<AuthRepository>();
  var _connectivity = getIt.get<ConnectivityCheck>();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is DoLogin) {
      if (state is LoginFailure) {
        yield LoginInitial();
      }
      yield LoginLoading();

      try {
        final bool _isConnected = await _connectivity.checkConnection();

        if (!_isConnected) {
          yield LoginFailure(msg: 'No internet connection');
        } else {
          var _response = await _repo.signIn(email: event.email, password: event.password);
          if (_response.status) {
            getIt<AuthBloc>().add(LoggedIn(token: _response.message));
            yield LoginSuccess(msg: _response.message);
          } else {
            yield LoginFailure(msg: _response.message);
          }
        }
      } catch (e) {
        yield LoginFailure(msg: e.toString());
      }
    }
  }
}
