import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secretwall/src/secretwall.dart';
import 'package:secretwall/src/shared/data/constants/dependencies.dart';
import 'package:secretwall/src/shared/data/constants/string.dart';

void main() {
  /// Inject global providers before the widget tree
  runApp(MultiRepositoryProvider(
      providers: globalProviders,
      child: const SecretWall(key: Key(secretWallKey))));
}
