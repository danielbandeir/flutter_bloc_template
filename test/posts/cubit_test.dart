// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:secretwall/src/posts/cubit/posts.cubit.dart';
// import 'package:secretwall/src/posts/cubit/posts.states.dart';

// /// Mocked posts cubit
// class MockPostCubit extends MockCubit<PostsStates> implements PostsCubit {}

// class PostsStatesFake extends Fake implements PostsStates {}

// void main() {
//   group('Cubit Tests', () {
//     late PostsCubit cubit;

//     setUp(() {
//       cubit = MockPostCubit();
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
//       act: (PostsCubit cubit) => cubit.getAllPosts(),
//       wait: const Duration(seconds: 2),
//       expect: () => <dynamic>[PostLoading, PostSuccess]
//     );
//   });
// }