import 'package:json_annotation/json_annotation.dart';

import '../../models/door.dart';
import '../../models/lamp.dart';

part 'get_devices.g.dart';

@JsonSerializable()
class GetDevicesResponse {
  GetDevicesResponse(this.lamps, this.doors);
  final List<Lamp> lamps;
  final List<Door> doors;

  factory GetDevicesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDevicesResponseFromJson(json);
}
