import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitter_clone/helpers/get_firebase_error.dart';
import 'package:twitter_clone/locator.dart';
import 'package:twitter_clone/models/tweet_model.dart';
import 'package:twitter_clone/models/response_model.dart';
import 'package:twitter_clone/models/user_model.dart';

class PostTweetRepo{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ResponseModel>tweet({String tweet})async{
    String uid = getIt.get<SharedPreferences>().get('uid');
    print('uid => $uid');
    try{
      final _user = await _firestore.doc('users/$uid').get();
      final _res = UserModel.fromJson(_user.data());
      final data = TweetModel(
        postedBy: _res.username,tweet: tweet,likes: 0,comments: 0
      );
      await _firestore.collection('tweets').add(data.toJson());
      return ResponseModel(status: true,message: 'Tweet Success');
    }catch(e){
      print(e);
      return ResponseModel(status: false,message: e.toString().getErrorFirebase);
    }
  }
}
