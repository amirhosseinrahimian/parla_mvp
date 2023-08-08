// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lamp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lamp _$LampFromJson(Map<String, dynamic> json) => Lamp(
      json['id'],
      json['name'],
      json['order'],
      json['roomID'],
      json['device_type'],
      json['state'] as String,
    );

Map<String, dynamic> _$LampToJson(Lamp instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'roomID': instance.roomID,
      'device_type': instance.device_type,
      'state': instance.state,
    };
