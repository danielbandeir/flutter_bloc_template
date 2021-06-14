// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:secretwall/src/posts/cubit/posts.cubit.dart';
// import 'package:secretwall/src/posts/cubit/posts.states.dart';
// import 'package:secretwall/src/posts/data/models/post.dart';
// import 'package:secretwall/src/posts/repository/impl/posts.repository.dart';
// import 'package:secretwall/src/posts/usecases/get_all_posts_usecase.dart';

// /// Mocked posts cubit
// class MockPostCubit extends MockCubit<PostsStates> implements PostsCubit {
//   @override
//   Future<void> getAllPosts() async {
//     emit(PostLoading());

//     emit(PostSuccess(posts: <Post>[
//       Post(
//         creationDate: '',
//         id: 1,
//         text: 'Testando'
//       )
//     ]));
//   }
// }

// /// Mock repository
// class MockPostsRepository extends Mock implements PostRepository {}

// class PostsStatesFake extends Fake implements PostsStates {}

// void main() {
//   group('Cubit Tests', () {
//     late PostsCubit cubit;
//     late PostRepository repository;

//     setUp(() {
//       repository = MockPostsRepository();
//       cubit = PostsCubit(
//         PostLoading(),
//         getAllPostsUseCase: GetAllPostsUseCase(repository),
//       );
//     });

//     setUpAll(() {
//       registerFallbackValue<PostsStates>(PostsStatesFake());
//     });

//     blocTest<PostsCubit, PostsStates>('Emit any state when call cubit', 
//       build: () => cubit,
//       expect: () => <dynamic>[]
//     );
//     blocTest<PostsCubit, PostsStates>('Get all posts states', 
//       build: () => cubit,
//       act: (PostsCubit cubit) {
//         when(repository.getAllPosts())
//       },
//       wait: const Duration(seconds: 2),
//       expect: () => <dynamic>[PostLoading, PostSuccess]
//     );
//   });
// }