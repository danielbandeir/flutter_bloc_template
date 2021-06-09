import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secretwall/src/shared/data/constants/global_keys.dart';

/// Inject global dependencies
final List<Provider<dynamic>> globalProviders = <Provider<dynamic>>[
  Provider<GlobalKeys>(create: (BuildContext context) => GlobalKeys()),
  Provider<Dio>(create: (BuildContext context) => Dio())
];
