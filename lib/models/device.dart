import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

@JsonSerializable()
class Device {
  Device(
    this.id,
    this.name,
    this.order,
    this.roomID,
    this.device_type,
  );

  final int id;
  final String name;
  final int order;
  final int roomID;
  final int device_type;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}
