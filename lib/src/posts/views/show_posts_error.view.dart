import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:secretwall/src/posts/data/constants/sizes.dart';
import 'package:secretwall/src/shared/data/constants/string.dart';

/// Error widget to show in show when error is open
class ShowPostsErrorView extends StatelessWidget {
  const ShowPostsErrorView({Key? key, this.error}) : super(key: key);

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.error),
          const SizedBox(height: k20),
          const Text(oopsErrorMessage),
          const SizedBox(height: k12),
          Text(error!),
        ],
      ),
    );
  }
}
