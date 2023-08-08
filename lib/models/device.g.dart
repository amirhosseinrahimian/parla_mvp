// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Device _$DeviceFromJson(Map<String, dynamic> json) => Device(
      json['id'] as int,
      json['name'] as String,
      json['order'] as int,
      json['roomID'] as int,
      json['device_type'] as int,
    );

Map<String, dynamic> _$DeviceToJson(Device instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'roomID': instance.roomID,
      'device_type': instance.device_type,
    };
