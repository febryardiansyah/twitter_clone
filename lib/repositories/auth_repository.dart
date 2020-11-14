import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_clone/locator.dart';
import 'package:twitter_clone/models/response_model.dart';
import 'package:twitter_clone/models/user_model.dart';
import 'package:twitter_clone/helpers/get_firebase_error.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _sharefPrefs = getIt.get<SharedPreferences>();

  Future<ResponseModel> createUser({String fullName,String username,String email,String password})async{
    try{
      bool _isUsernameExist = await _checkUsername(username);
      if(_isUsernameExist){
        return ResponseModel(status: false,message: 'Username already exist');
      }

      final User user =( await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
      UserModel userModel = UserModel(
        name: fullName,username: username,uuid: user.uid,email: email,imageProfile: 'https://revolution.kunbus.de/forum/styles/revolution/theme/images/no_avatar.jpg'
      );
      await _firestore.collection('users').doc(user.uid).set(userModel.toJson());
      return ResponseModel(status: true,message: 'Create account success');
    }catch (e){
      print(e);
      return ResponseModel(status: false,message: '$e'.getErrorFirebase);
    }
  }

  Future<ResponseModel>signIn({String email,String password})async{
    if(email.isEmpty){
      return ResponseModel(status: false,message: 'Email must not be empty');
    }
    if(password.isEmpty){
      return ResponseModel(status: false,message: 'Password must not be empty');
    }
    try{
      User _user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
      assert(_user != null);
      assert(await _user.getIdToken() != null);

      _sharefPrefs.setString('uid', _user.uid);

      return ResponseModel(status: true,message: _user.uid);
    }catch (e){
      print(e);
      String msg = e.toString().getErrorFirebase;
      return ResponseModel(status: false,message: msg);
    }
  }

  Future<void> signOut()async{
    Firebase.initializeApp();
    await deleteToken();
    await _firebaseAuth.signOut();
  }
  
  Future<void> deleteToken()async{
    _sharefPrefs.remove('uid');
  }

  Future<void> persistToken(String uid)async{
    await _sharefPrefs.setString('uid', uid);
    return;
  }

  Future<bool> hasToken()async{
    return _sharefPrefs.get('uid') == null ?false:true;
  }

  Future<bool> _checkUsername(String username)async{
    final res = await _firestore.collection('users').where('username',isEqualTo: username).get();
    return res.docs.isNotEmpty;
  }

}