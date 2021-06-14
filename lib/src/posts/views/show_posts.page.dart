import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secretwall/src/posts/cubit/posts.cubit.dart';
import 'package:secretwall/src/posts/cubit/posts.states.dart';
import 'package:secretwall/src/posts/data/constants/string.dart';
import 'package:secretwall/src/posts/views/add_post_view.dart';
import 'package:secretwall/src/posts/views/show_posts_error.view.dart';
import 'package:secretwall/src/posts/views/show_posts_loading.view.dart';
import 'package:secretwall/src/posts/views/show_posts_success.view.dart';
import 'package:secretwall/src/shared/data/constants/string.dart';

class ShowPostsPage extends StatelessWidget {
  const ShowPostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Request the cubit that is injected in [posts.page.dart]
    final PostsCubit postsCubit = context.read<PostsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        actions: <Widget>[
          IconButton(
              onPressed: () => addPostView(context, postsCubit),
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<PostsCubit, PostsStates>(
        bloc: postsCubit,
        builder: (BuildContext context, PostsStates state) {
          if (state is PostInitial) {
            /// If is initial state, means that doesn't have any posts, so we'll call the posts
            postsCubit.getAllPosts();

            return const ShowPostsLoadingView(
              key: Key(showPostsInitialViewKey),
            );
          } else if (state is PostLoading) {
            return const ShowPostsLoadingView(
              key: Key(showPostsLoadingViewKey),
            );
          } else if (state is PostSuccess) {
            return ShowPostsSuccessView(
              posts: state.posts,
              key: const Key(showPostsSuccessViewKey),
            );
          } else if (state is PostError) {
            return ShowPostsErrorView(
              error: state.error ?? genericErrorMessage,
              key: const Key(showPostsErrorViewKey),
            );
          } else {
            return const ShowPostsErrorView(
              error: genericErrorMessage,
              key: Key(showPostsInitialErrorViewKey),
            );
          }
        },
      ),
    );
  }
}
