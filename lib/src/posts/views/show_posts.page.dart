import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secretwall/src/posts/cubit/posts.cubit.dart';
import 'package:secretwall/src/posts/cubit/posts.states.dart';
import 'package:secretwall/src/posts/data/constants/sizes.dart';
import 'package:secretwall/src/posts/data/constants/string.dart';
import 'package:secretwall/src/posts/views/show_posts_error.view.dart';
import 'package:secretwall/src/posts/views/show_posts_loading.view.dart';
import 'package:secretwall/src/posts/views/show_posts_success.view.dart';
import 'package:secretwall/src/shared/data/constants/string.dart';

class ShowPostsPage extends StatelessWidget {
  const ShowPostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Request the cubit that is injected in [posts.page.dart]
    final PostsCubit postsCubit = BlocProvider.of<PostsCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        actions: <Widget>[
          IconButton(
              onPressed: () => _addPost(context, postsCubit), icon: const Icon(Icons.add))
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
          } 
          else if (state is PostLoading) {
            return const ShowPostsLoadingView(
              key: Key(showPostsLoadingViewKey),
            );
          }
          else if (state is PostSuccess) {
            return ShowPostsSuccessView(
              posts: state.posts,
              key: const Key(showPostsSuccessViewKey),
            );
          }
          else if (state is PostError) {
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

  /// Bottomsheet to add post
  Future<void> _addPost(BuildContext context, PostsCubit postsCubit) async {
    final TextEditingController postController = TextEditingController();

    await showModalBottomSheet<dynamic>(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: k22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: k40,
            ),
            const Text(newPost),
            const SizedBox(
              height: k12,
            ),
            TextField(
              controller: postController,
              maxLines: kFive.toInt(),
            ),
            const SizedBox(
              height: k12,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () => postsCubit.savePost(postController.value.text),
                child: const Text(saveUpperCase)
              ),
            ),
            const SizedBox(
              height: k40,
            ),
          ],
        ),
      ),
    );
  }
}
