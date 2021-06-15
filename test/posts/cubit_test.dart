import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mocktail/mocktail.dart';
import 'package:secretwall/src/posts/cubit/posts.cubit.dart';
import 'package:secretwall/src/posts/cubit/posts.states.dart';
import 'package:secretwall/src/posts/data/models/post.dart';
import 'package:secretwall/src/posts/repository/impl/posts.repository.dart';
import 'package:secretwall/src/posts/usecases/get_all_posts_usecase.dart';
import 'package:secretwall/src/posts/usecases/save_post_usecase.dart';

/// Mocked posts cubit
class MockPostCubit extends MockCubit<PostsStates> implements PostsCubit {}

/// Mock repository
class MockPostsRepository extends Mock implements PostRepository {}

class PostsStatesFake extends Fake implements PostsStates {}

final Future<List<Post>> getAllPostsExample = Future<List<Post>>.value(<Post>[
          Post(
            id: 2,
            creationDate: '2021-06-02 12:11',
            text: 'This is a post!'
          ),
          Post(
            id: 3,
            creationDate: '2021-06-02 12:11',
            text: 'This is another post!'
          )
        ]);

void main() {
  group('Cubit Tests', () {
    late PostsCubit cubit;
    late PostRepository repository;

    setUp(() {
      repository = MockPostsRepository();
      cubit = PostsCubit(
        PostLoading(),
        getAllPostsUseCase: GetAllPostsUseCase(repository),
        savePostUseCase: SavePostUseCase(repository),
        navigator: GlobalKey<NavigatorState>(),
        toast: FToast()
      );
    });

    setUpAll(() {
      registerFallbackValue<PostsStates>(PostsStatesFake());
    });

    blocTest<PostsCubit, PostsStates>('Emit any state when call cubit',
      build: () => cubit,
      expect: () => <dynamic>[]
    );
    // blocTest<PostsCubit, PostsStates>('Get all posts states',
    //   build: () => cubit,
    //   act: (PostsCubit cubit) {
    //     when(() async {
    //       return repository.getAllPosts();
    //     }).thenAnswer((_) async => getAllPostsExample);
    //   },
    //   wait: const Duration(seconds: 2),
    //   expect: () => <dynamic>[PostLoading, PostSuccess]
    // );
  });
}
