import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:secretwall/src/posts/cubit/posts.cubit.dart';
import 'package:secretwall/src/posts/cubit/posts.states.dart';
import 'package:secretwall/src/posts/data/constants/string.dart';
import 'package:secretwall/src/posts/repository/impl/posts.repository.dart';
import 'package:secretwall/src/posts/repository/iposts.repository.dart';
import 'package:secretwall/src/posts/service/impl/posts.service.dart';
import 'package:secretwall/src/posts/service/iposts.service.dart';
import 'package:secretwall/src/posts/usecases/get_all_posts_usecase.dart';
import 'package:secretwall/src/posts/usecases/save_post_usecase.dart';
import 'package:secretwall/src/posts/views/show_posts.page.dart';
import 'package:secretwall/src/shared/data/constants/global_keys.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Posts services to require the data
    final IPostsService postsService =
        PostService(http: context.read<Dio>());

    /// Posts repository to model the data
    final IPostsRepository postsRepository =
        PostRepository(service: postsService);

    /// Inject provider for his module
    return RepositoryProvider<IPostsRepository>(
      create: (BuildContext context) => postsRepository,
      child: BlocProvider<PostsCubit>(
        create: (BuildContext context) => PostsCubit(
          PostInitial(),
          toast: context.read<FToast>(),
          navigator: context.read<GlobalKeys>().navigatorState,
          getAllPostsUseCase: GetAllPostsUseCase(context.read<IPostsRepository>()),
          savePostUseCase: SavePostUseCase(context.read<IPostsRepository>()),
        ),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: postsModuleName,
          home: Scaffold(
            backgroundColor: Colors.black,
            body: ShowPostsPage(
              key: Key(showPostsKey),
            ),
          ),
        ),
      ),
    );
  }
}
