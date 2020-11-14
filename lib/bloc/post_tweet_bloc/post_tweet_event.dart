part of 'post_tweet_bloc.dart';

abstract class PostTweetEvent extends Equatable {
  const PostTweetEvent();
  @override
  List<Object> get props => [];
}

class DoPostTweet extends PostTweetEvent{
  final String tweet;

  DoPostTweet({this.tweet});

  @override
  List<Object> get props => [tweet];
}
