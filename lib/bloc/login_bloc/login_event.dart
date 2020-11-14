part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}
class DoLogin extends LoginEvent{
  final String email;
  final String password;

  DoLogin({this.email, this.password});

  @override
  List<Object> get props => [email,password];
}
