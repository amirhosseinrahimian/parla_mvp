import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:parla_home/models/device.dart';
import 'package:parla_home/network/response/get_devices.dart';
import 'package:parla_home/network/response/get_rooms.dart';
import 'package:parla_home/network/response/toggle.dart';

import 'api/api.dart';

class AppRepository {
  String _ip = '31.25.132.103';
  late ApiClient _apiRequest;
  late Dio dio;

  static final AppRepository _instance = AppRepository._();

  AppRepository._() {
    dio = Dio();
    _apiRequest = ApiClient(dio, baseUrl: 'http://$_ip:9000/api/');
  }

  static AppRepository get instance => _instance;

  void changeIp(String ip) {
    _ip = ip;
  }

  String getIp() {
    return _ip;
  }

  Future<GetRoomsResponse> getRooms() {
    return _apiRequest.getRooms();
  }

  Future<GetDevicesResponse> getDevices(int roomId) {
    return _apiRequest.getDevices(roomId);
  }

  Future<ToggleResponse> toggle(Device device) {
    debugPrint(device.id.toString() + ' - ' + device.name);
    return (device.device_type == 0)
        ? _apiRequest.toggleLamp(device.id)
        : _apiRequest.toggleDoor(device.id);
  }
}
