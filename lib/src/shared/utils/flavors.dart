import 'package:secretwall/src/shared/data/models/environment.dart';
import 'package:secretwall/src/shared/utils/dev_flavors.dart';
import 'package:secretwall/src/shared/utils/prod_flavors.dart';
import 'package:secretwall/src/shared/utils/qa_flavors.dart';

enum Flavor {
  DEV,
  QA,
  PROD,
}

// ignore: avoid_classes_with_only_static_members
class F {
  static late Flavor appFlavor;

  static Environment get environment {
    switch (appFlavor) {
      case Flavor.DEV:
        return Environment.fromJson(devFlavors);
      case Flavor.QA:
        return Environment.fromJson(qaFlavors);
      case Flavor.PROD:
        return Environment.fromJson(prodFlavors);
      default:
        return Environment.fromJson(prodFlavors);
    }
  }
}
