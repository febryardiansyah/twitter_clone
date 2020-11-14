part of 'post_tweet_bloc.dart';

abstract class PostTweetState extends Equatable {
  const PostTweetState();
  @override
  List<Object> get props => [];
}

class PostTweetInitial extends PostTweetState {}
class PostTweetLoading extends PostTweetState {}
class PostTweetSuccess extends PostTweetState {
  final String msg;

  PostTweetSuccess({this.msg});

  @override
  List<Object> get props => [msg];
}
class PostTweetFailure extends PostTweetState {
  final String msg;

  PostTweetFailure({this.msg});

  @override
  List<Object> get props => [msg];
}
