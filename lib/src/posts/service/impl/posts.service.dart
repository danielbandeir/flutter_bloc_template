import 'package:dio/dio.dart';
import 'package:secretwall/src/posts/data/constants/posts_endpoints.dart';
import 'package:secretwall/src/posts/data/models/post.dart';
import 'package:secretwall/src/posts/service/iposts.service.dart';

/// Service to request all the posts and to save post
class PostService implements IPostsService {
  PostService({
    this.http
  });
  
  late Dio? http;

  @override
  Future<Response<List<dynamic>>> getAllPosts() async {
    return http!.get(PostsEndpoints.getAllPosts);
  }

  @override
  Future<Response<Map<String, dynamic>>?> savePost(Post post) {
    return http!.post(PostsEndpoints.savePost, data: post.toJson());
  }

}