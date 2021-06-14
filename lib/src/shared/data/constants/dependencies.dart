import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:secretwall/src/shared/data/constants/global_keys.dart';

/// Inject global dependencies
final List<RepositoryProvider<dynamic>> globalProviders =
    <RepositoryProvider<dynamic>>[
  RepositoryProvider<GlobalKeys>(
      create: (BuildContext context) => GlobalKeys()),
  RepositoryProvider<Dio>(
      create: (BuildContext context) => Dio(BaseOptions(
          receiveDataWhenStatusError: true,
          connectTimeout: 5 * 1000, // 60 seconds
          receiveTimeout: 5 * 1000))),
  RepositoryProvider<FToast>(create: (BuildContext context) => FToast())
];
