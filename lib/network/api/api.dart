import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../response/get_devices.dart';
import '../response/get_rooms.dart';
import '../response/toggle.dart';

part 'api.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("room/")
  Future<GetRoomsResponse> getRooms();

  @POST("devices/get_device_by_room/")
  Future<GetDevicesResponse> getDevices(@Field("roomID") int roomId);

  @POST("lamp/toggle_lamp/")
  Future<ToggleResponse> toggleLamp(@Field("id") int lamp_id);

  @POST("door/toggle_door/")
  Future<ToggleResponse> toggleDoor(@Field("id") int door_id);
}
