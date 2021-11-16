class PostRequest {
  int userId;
  String title;
  String body;

  PostRequest({this.userId, this.title, this.body});

  Map toJson() => {
        'userId': userId,
        'title': title,
        'body': body,
      };
}
