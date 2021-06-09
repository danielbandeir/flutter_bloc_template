import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Loading layer to show posts
class ShowPostsLoadingView extends StatelessWidget {
  const ShowPostsLoadingView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid ? const CircularProgressIndicator() : const CupertinoActivityIndicator(),
    );
  }
}