import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secretwall/src/posts/cubit/posts.cubit.dart';
import 'package:secretwall/src/posts/data/constants/sizes.dart';
import 'package:secretwall/src/posts/data/models/post.dart';

/// Success view afetr success to get the posts or make any post
class ShowPostsSuccessView extends StatelessWidget {
  const ShowPostsSuccessView({Key? key, required this.posts}) : super(key: key);

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => BlocProvider.of<PostsCubit>(context).refreshPosts(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: k32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List<Widget>.generate(
                posts.length,
                (int index) => Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: kOne, color: Colors.black))),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: k22),
                          child: Text(
                            posts[index].text!,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
