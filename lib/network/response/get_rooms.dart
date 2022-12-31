import 'package:json_annotation/json_annotation.dart';

import '../../models/room.dart';

part 'get_rooms.g.dart';

@JsonSerializable()
class GetRoomsResponse {
  GetRoomsResponse(this.rooms, this.count);
  final int count;
  @JsonKey(name: 'room')
  final List<Room> rooms;

  factory GetRoomsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRoomsResponseFromJson(json);
}
