// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'door.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Door _$DoorFromJson(Map<String, dynamic> json) => Door(
      json['id'],
      json['name'],
      json['roomID'],
      json['device_type'],
      json['state'] as String,
    );

Map<String, dynamic> _$DoorToJson(Door instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'roomID': instance.roomID,
      'device_type': instance.device_type,
      'state': instance.state,
    };
