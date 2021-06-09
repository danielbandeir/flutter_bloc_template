import 'package:secretwall/src/posts/data/models/post.dart';
import 'package:secretwall/src/posts/repository/iposts.repository.dart';

/// Get all the posts from backend side
class GetAllPostsUseCase {
  const GetAllPostsUseCase(this.repository);

  final IPostsRepository? repository;

  Future<List<Post>> execute() async {
    return repository!.getAllPosts();
  }
}