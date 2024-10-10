class PostModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  PostModel({this.postId, this.id, this.name, this.email, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json["postId"] is int) {
      postId = json["postId"];
    }
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["body"] is String) {
      body = json["body"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["postId"] = postId;
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["body"] = body;
    return _data;
  }
}
