import 'package:equatable/equatable.dart';

class ResponseModel extends Equatable{
  bool status;
  String message;


  ResponseModel({this.status, this.message});

  @override
  List<Object> get props => [status,message];
}