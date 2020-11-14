import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:twitter_clone/helpers/connectivity_check.dart';
import 'package:twitter_clone/locator.dart';
import 'package:twitter_clone/repositories/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  var _connectivity = getIt.get<ConnectivityCheck>();
  var _repo = getIt.get<AuthRepository>();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if(event is DoRegister){
      if(state is RegisterFailure){
        yield RegisterInitial();
      }
      yield RegisterLoading();
      try{
        final bool _isConnected = await _connectivity.checkConnection();
        if(!_isConnected) yield RegisterFailure(msg: 'No internet connection');

        final _responseStatus = await _repo.createUser(
          email: event.email,username: event.username,password: event.password,fullName: event.name
        );

        if(_responseStatus.status){
          yield RegisterSuccess(msg: _responseStatus.message);
        }else{
          yield RegisterFailure(msg: _responseStatus.message);
        }
      }catch(e){
        yield RegisterFailure(msg: e.toString());
      }
    }
  }
}
