import 'package:secretwall/src/shared/data/constants/base_endpoint.dart';

// ignore: avoid_classes_with_only_static_members
/// Endpoints just for post module
class PostsEndpoints {
  static String getAllPosts = '${BaseEndpoint.url}/posts';
  static String getPostById(String id) => '${BaseEndpoint.url}/posts/$id';
  static String savePost = '${BaseEndpoint.url}/posts';
}
