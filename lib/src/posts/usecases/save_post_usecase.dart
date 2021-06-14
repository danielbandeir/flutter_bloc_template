import 'package:secretwall/src/posts/data/models/post.dart';
import 'package:secretwall/src/posts/repository/iposts.repository.dart';

/// Make request to save the post
class SavePostUseCase {
  const SavePostUseCase(this.repository);

  final IPostsRepository repository;

  Future<Post> execute(Post post) async {
    return repository.savePost(post);
  }
}
