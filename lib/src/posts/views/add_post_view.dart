import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:secretwall/src/posts/cubit/posts.cubit.dart';
import 'package:secretwall/src/posts/data/constants/sizes.dart';
import 'package:secretwall/src/posts/data/constants/string.dart';

/// Bottomsheet to add post
Future<void> addPostView(BuildContext context, PostsCubit postsCubit) async {
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
                child: const Text(saveUpperCase)),
          ),
          const SizedBox(
            height: k40,
          ),
        ],
      ),
    ),
  );
}
