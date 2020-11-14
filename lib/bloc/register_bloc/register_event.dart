part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}
class DoRegister extends RegisterEvent{
  final String username;
  final String name;
  final String email;
  final String password;

  DoRegister({this.username, this.name, this.email, this.password});

  @override
  List<Object> get props => [username,name,email,password];
}
