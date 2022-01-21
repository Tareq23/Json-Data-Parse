

class PostModel{
  int? userId;
  int? postId;
  String? title;
  String? body;

  PostModel({this.userId, this.postId, this.title, this.body});

  PostModel.fromJson(Map<String,dynamic>json)
  {
    userId = json['userId'];
    postId = json['id'];
    title = json['title'];
    body = json['body'];
  }

}