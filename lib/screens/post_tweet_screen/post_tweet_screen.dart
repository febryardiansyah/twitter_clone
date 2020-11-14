import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone/bloc/post_tweet_bloc/post_tweet_bloc.dart';
import 'package:twitter_clone/utils/base_color.dart';

class PostTweetScreen extends StatefulWidget {
  PostTweetScreen({Key key}) : super(key: key);

  @override
  _PostTweetScreenState createState() => _PostTweetScreenState();
}

class _PostTweetScreenState extends State<PostTweetScreen> {
  TextEditingController _tweet = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FlatButton(
                color: BaseColor.blue1,
                child: Text('Tweet',style: TextStyle(color: BaseColor.white),),
                onPressed: ()=>context.bloc<PostTweetBloc>().add(DoPostTweet(
                  tweet: _tweet.text
                )),
              ),
            ),
          )
        ],
      ),
      body: BlocListener<PostTweetBloc,PostTweetState>(
        listener: (context,state){
          if(state is PostTweetLoading){
            Scaffold.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text('Wait a sec'),));
          }
          if(state is PostTweetFailure){
            Scaffold.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(state.msg,)));
          }
          if(state is PostTweetSuccess){
            Scaffold.of(context)..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(state.msg),));
            Navigator.pop(context);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: BaseColor.white,
                  maxRadius: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: _tweet,
                      maxLines: 8,
                      style: TextStyle(color: BaseColor.white),
                      decoration: InputDecoration(
                        hintText: "What's happening ?",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}