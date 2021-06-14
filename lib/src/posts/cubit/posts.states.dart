

import 'package:equatable/equatable.dart';
import 'package:secretwall/src/posts/data/models/post.dart';

/// Base post state
abstract class PostsStates extends Equatable {}

/// First state, call when posts cubit is instantiated
class PostInitial implements PostsStates {
  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}

/// State to make loading
class PostLoading implements PostsStates {
  @override
  List<Object?> get props => throw UnimplementedError();

  @override
  bool? get stringify => throw UnimplementedError();
}

/// State that is used to call success layer
class PostSuccess implements PostsStates {
  const PostSuccess({required this.posts});

  final List<Post> posts;

  @override
  List<Object?> get props => <Object?>[posts];

  @override
  bool? get stringify => throw UnimplementedError();
}

/// ERROR state
class PostError implements PostsStates {
  const PostError({this.error});

  final String? error;

  @override
  List<Object?> get props => <Object?>[error];

  @override
  bool? get stringify => throw UnimplementedError();
}