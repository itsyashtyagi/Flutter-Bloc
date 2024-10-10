import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_basic/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body.toString()) as List;
        return body.map(
          (e) {
            return PostModel(
              postId: e["postId"] as int,
              email: e["email"] as String,
              body: e["body"] as String,
            );
          },
        ).toList();
      }
    } on SocketException {
      throw Exception("No Internet Connection");
    }
    throw Exception("Something went wrong while fectching the post data");
  }
}
