import 'package:json_annotation/json_annotation.dart';
import 'package:parla_home/models/device.dart';

part 'lamp.g.dart';

@JsonSerializable()
class Lamp extends Device {
  Lamp(
    id,
    name,
    order,
    roomID,
    device_type,
    this.state,
  ) : super(
          id,
          name,
          order,
          roomID,
          device_type,
        );

  final String state;

  factory Lamp.fromJson(Map<String, dynamic> json) => _$LampFromJson(json);

  Map<String, dynamic> toJson() => _$LampToJson(this);
}
