import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Loading layer to show posts
class ShowPostsLoadingView extends StatelessWidget {
  const ShowPostsLoadingView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}