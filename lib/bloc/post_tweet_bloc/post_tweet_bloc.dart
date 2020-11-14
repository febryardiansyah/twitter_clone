import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:twitter_clone/helpers/connectivity_check.dart';
import 'package:twitter_clone/locator.dart';
import 'package:twitter_clone/repositories/post_tweet_repo.dart';

part 'post_tweet_event.dart';
part 'post_tweet_state.dart';

class PostTweetBloc extends Bloc<PostTweetEvent, PostTweetState> {
  PostTweetBloc() : super(PostTweetInitial());

  var _connectivity = getIt.get<ConnectivityCheck>();
  var _repo = getIt.get<PostTweetRepo>();

  @override
  Stream<PostTweetState> mapEventToState(
    PostTweetEvent event,
  ) async* {
    if(event is DoPostTweet){
      yield PostTweetLoading();
      try{
        final res = await _repo.tweet(tweet: event.tweet);
        if(res.status){
          yield PostTweetSuccess(msg: res.message);
        }else{
          yield PostTweetFailure(msg: res.message);
        }
      }catch(e){
        yield PostTweetFailure(msg: e.toString());
      }
    }
  }
}
