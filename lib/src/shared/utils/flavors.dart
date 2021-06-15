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

  static Map<String, dynamic> get environment {
    switch (appFlavor) {
      case Flavor.DEV:
        return devFlavors;
      case Flavor.QA:
        return qaFlavors;
      case Flavor.PROD:
        return prodFlavors;
      default:
        return prodFlavors;
    }
  }

}