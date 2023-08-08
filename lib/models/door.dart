import 'package:json_annotation/json_annotation.dart';
import 'package:parla_home/models/device.dart';

part 'door.g.dart';

@JsonSerializable()
class Door extends Device {
  Door(
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

  factory Door.fromJson(Map<String, dynamic> json) => _$DoorFromJson(json);

  Map<String, dynamic> toJson() => _$DoorToJson(this);
}
