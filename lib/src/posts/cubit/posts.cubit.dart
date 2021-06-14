import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:secretwall/src/posts/cubit/posts.states.dart';
import 'package:secretwall/src/posts/data/constants/sizes.dart';
import 'package:secretwall/src/posts/data/models/post.dart';
import 'package:secretwall/src/posts/usecases/get_all_posts_usecase.dart';
import 'package:secretwall/src/posts/usecases/save_post_usecase.dart';
import 'package:secretwall/src/shared/data/constants/string.dart';
import 'package:secretwall/src/shared/widgets/toast.dart';

/// Here is where we create the logic about posts
class PostsCubit extends Cubit<PostsStates> {
  PostsCubit(PostsStates initialState, {required this.getAllPostsUseCase,required this.savePostUseCase, required this.navigator, required this.toast}) : super(initialState);

  /// Key to make navigation inside cubit
  final GlobalKey<NavigatorState> navigator;
  final FToast toast;
  final GetAllPostsUseCase getAllPostsUseCase;
  final SavePostUseCase savePostUseCase;

  /// Method to call posts again, if occour a error we pass the oldest posts
  Future<void> refreshPosts() async {
    final List<Post> oldPosts = (state as PostSuccess).posts;

    emit(PostLoading());

    try {
      final List<Post> posts = await getAllPostsUseCase.execute();

      await Future<dynamic>.delayed(Duration(seconds: kOne.toInt()));

      emit(PostSuccess(posts: posts));
    } catch (e) {
      errorToast(e.toString(), toast);
      emit(PostSuccess(posts: oldPosts));
    }
  }

  /// Method to call all posts, normally call in initial state
  Future<void> getAllPosts() async {
    emit(PostLoading());

    try {
      final List<Post> posts = await getAllPostsUseCase.execute();

      await Future<dynamic>.delayed(Duration(seconds: kOne.toInt()));

      emit(PostSuccess(posts: posts));
    } catch (e) {
      emit(const PostError(error: genericErrorMessage));
    }
  }

  /// Make request to save post
  Future<void> savePost(String text) async {
    emit(PostLoading());

    navigator.currentState!.pop();

      await Future<dynamic>.delayed(Duration(seconds: kOne.toInt()));

    try {
      await savePostUseCase.execute(Post(
        text: text
      ));
      
      final List<Post> posts = await getAllPostsUseCase.execute();

      emit(PostSuccess(posts: posts));
    } catch (e) {
      emit(const PostError(error: genericErrorMessage));
    }
  }
}
