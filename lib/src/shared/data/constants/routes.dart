import 'package:flutter/material.dart';
import 'package:secretwall/src/posts/posts.page.dart';
import 'package:secretwall/src/shared/data/constants/string.dart';

/// Base routes, this is the routes just for each module
final Map<String, WidgetBuilder> sharedRoutes = <String, WidgetBuilder>{
  postRoute: (BuildContext context) => const PostsPage(
    key: Key(postPageKey),
  )
};