import 'package:secretwall/src/posts/data/models/post.dart';

abstract class IPostsRepository {
  Future<List<Post>> getAllPosts();
  Future<Post> savePost(Post post);
}
