import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:secretwall/src/posts/data/models/post.dart';
import 'package:secretwall/src/posts/repository/iposts.repository.dart';
import 'package:secretwall/src/posts/service/iposts.service.dart';
import 'package:secretwall/src/shared/data/constants/string.dart';

/// Repository to model the data before send to the service pattern to make request
class PostRepository implements IPostsRepository {
  const PostRepository({required this.service});

  final IPostsService service; 

  @override
  Future<List<Post>> getAllPosts() async {
    final Response<List<dynamic>> response = await service.getAllPosts();

    final List<dynamic> posts = response.data!;

    final List<Post> returnPosts = posts.map((dynamic post) => Post.fromJson(post as Map<String, dynamic>)).toList();
    
    return returnPosts;
  }

  @override
  Future<Post> savePost(Post post) async {
    post.creationDate = DateFormat(commonDateFormat).format(DateTime.now());

    final Response<dynamic> response = await service.savePost(post);

    return Post.fromJson(response.data as Map<String, dynamic>);
  }

}