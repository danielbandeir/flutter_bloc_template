import 'package:secretwall/src/shared/data/constants/string.dart';
import 'package:secretwall/src/shared/utils/flavors.dart';

// ignore: avoid_classes_with_only_static_members
class BaseEndpoint {
  /// Base Endpoint
  static String url = F.environment.baseUrl.toString();
}
