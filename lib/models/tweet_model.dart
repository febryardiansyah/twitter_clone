class TweetModel{
  String tweet;
  String postedBy;
  int likes;
  int comments;

  TweetModel({this.tweet, this.postedBy,this.comments,this.likes});


  factory TweetModel.fromMap(Map<String,dynamic>json){
    return TweetModel(
      tweet: json['tweet'],
      comments: json['comments'],
      likes: json['likes'],
      postedBy: json['postedBy']
    );
  }

  Map<String,dynamic> toJson()=>{
    "tweet":tweet,
    "postedBy":postedBy,
    "likes":likes,
    "comments":comments
  };
}