import 'package:projeto_minx_flutter/app/Feed/feed_repository.dart';
import 'package:projeto_minx_flutter/app/model/post.dart';

class FeedController{
  final _repository = FeedRepository();

  Future<List<Post>> getAllPost() async {
    final result = await _repository.getAllPost();
    return result;
  }
}