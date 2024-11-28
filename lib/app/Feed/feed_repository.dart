import 'package:dio/dio.dart';
import 'package:projeto_minx_flutter/app/model/post.dart';

class FeedRepository{
  final _dio = Dio();
  Future<List<Post>> getAllPost() async {
    final result = await _dio.get(
      "http://127.0.0.1:8000/api/feed",
    );

    print("");
    return List.from(result.data).map((e) => Post.fromMap(e)).toList();
  }
}