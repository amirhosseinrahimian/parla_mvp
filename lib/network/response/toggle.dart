import 'package:json_annotation/json_annotation.dart';

part 'toggle.g.dart';

@JsonSerializable()
class ToggleResponse {
  ToggleResponse(
    this.id,
    this.state,
  );
  final int id;
  final String state;

  factory ToggleResponse.fromJson(Map<String, dynamic> json) =>
      _$ToggleResponseFromJson(json);
}
