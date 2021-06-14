import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:secretwall/src/shared/data/constants/global_keys.dart';
import 'package:secretwall/src/shared/data/constants/routes.dart';
import 'package:secretwall/src/shared/data/constants/string.dart';

class SecretWall extends StatelessWidget {
  const SecretWall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    /// Get Global Key injected in main.dart
    final GlobalKeys _globalKeys = RepositoryProvider.of<GlobalKeys>(context);

    /// Get global instance toast to init
    final FToast toast = RepositoryProvider.of<FToast>(context);

    /// Init toast instance
    toast.init(context);

    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      routes: sharedRoutes,
      initialRoute: postRoute,
      navigatorKey: _globalKeys.navigatorState,
    );
  }
}
