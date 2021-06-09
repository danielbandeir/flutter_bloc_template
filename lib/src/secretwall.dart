import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secretwall/src/shared/data/constants/global_keys.dart';
import 'package:secretwall/src/shared/data/constants/routes.dart';
import 'package:secretwall/src/shared/data/constants/string.dart';

class SecretWall extends StatelessWidget {
  const SecretWall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    /// Get Global Key injected in main.dart
    final GlobalKeys _globalKeys = Provider.of<GlobalKeys>(context);

    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      routes: sharedRoutes,
      initialRoute: postRoute,
      navigatorKey: _globalKeys.navigatorState,
    );
  }
}
