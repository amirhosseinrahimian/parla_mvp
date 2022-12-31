// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_rooms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRoomsResponse _$GetRoomsResponseFromJson(Map<String, dynamic> json) =>
    GetRoomsResponse(
      (json['room'] as List<dynamic>)
          .map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['count'] as int,
    );

Map<String, dynamic> _$GetRoomsResponseToJson(GetRoomsResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'room': instance.rooms,
    };
