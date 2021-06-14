import 'package:dio/dio.dart';
import 'package:secretwall/src/posts/data/models/post.dart';

abstract class IPostsService {
  Future<Response<List<dynamic>>> getAllPosts();
  Future<Response<Map<String, dynamic>>> savePost(Post post);
}
