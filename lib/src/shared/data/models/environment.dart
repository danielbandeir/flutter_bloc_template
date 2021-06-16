import 'package:json_annotation/json_annotation.dart';

part 'environment.g.dart';

/// Environment model
@JsonSerializable()
class Environment {
  Environment({this.baseUrl});
  factory Environment.fromJson(Map<String, dynamic> json) => _$EnvironmentFromJson(json);

  final String? baseUrl;

  Map<String, dynamic> toJson() => _$EnvironmentToJson(this);
}
