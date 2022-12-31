// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_devices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDevicesResponse _$GetDevicesResponseFromJson(Map<String, dynamic> json) =>
    GetDevicesResponse(
      (json['lamps'] as List<dynamic>)
          .map((e) => Lamp.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['doors'] as List<dynamic>)
          .map((e) => Door.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDevicesResponseToJson(GetDevicesResponse instance) =>
    <String, dynamic>{
      'lamps': instance.lamps,
      'doors': instance.doors,
    };
