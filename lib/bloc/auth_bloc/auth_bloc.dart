import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:twitter_clone/locator.dart';
import 'package:twitter_clone/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  var _repo = getIt.get<AuthRepository>();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if(event is AppStarted){
      yield AuthLoading();
      final bool hasToken = await _repo.hasToken();
      if(hasToken){
        yield AuthAuthenticated();
      }else{
        yield AuthUnAuthenticated();
      }
    }
    if(event is LoggedIn){
      yield AuthLoading();
      try{
        await _repo.persistToken(event.token);
        yield AuthAuthenticated();
      }catch(e){
        yield AuthUnAuthenticated();
      }
    }
    if (event is LoggedOut) {
      await _repo.signOut();
      await _repo.deleteToken();
      yield AuthUnAuthenticated();
    }
  }
}
