import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends Equatable{
  String uuid;
  String name;
  String username;
  String email;
  String imageProfile;

  UserModel({this.uuid, this.name, this.email, this.imageProfile,this.username});


  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
      uuid: json['uid'],
      name: json['name'],
      email: json['email'],
      imageProfile: json['imageProfile'],
      username: json['username']
    );
  }

  // factory UserModel.fromDocument(DocumentSnapshot doc){
  //   return User
  // }

  Map<String,dynamic>toJson()=>{
    "uid":uuid,
    "name":name,
    "email":email,
    "imageProfile":imageProfile,
    "username":username
  };

  @override
  List<Object> get props => [];
}