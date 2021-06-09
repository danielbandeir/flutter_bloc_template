import 'package:secretwall/src/shared/data/constants/base_endpoint.dart';

/// Endpoints just for post module
class PostsEndpoints {
  static const String getAllPosts = '${BaseEndpoint.url}/posts';
  static String getPostById(String id) => '${BaseEndpoint.url}/posts/$id';
  static const String savePost = '${BaseEndpoint.url}/posts';
}