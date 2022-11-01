import 'package:flutter/services.dart';
import 'package:location/location.dart';

class GetLocationData{
  late Location _location;
  bool _serviceEnabled = false;
  PermissionStatus? _permissionStatus;

  GetLocationData(){
    _location = Location();
  }
  Future<bool> _checkPermission() async{
    if (await _checkService()){
      _permissionStatus = await _location.hasPermission();
      if (_permissionStatus == PermissionStatus.denied){
        _permissionStatus = await _location.requestPermission();
      }
    }

    return _permissionStatus == PermissionStatus.granted;
  }

  Future<bool> _checkService() async{
    try{
      _serviceEnabled = await _location.serviceEnabled();
      if (!_serviceEnabled){
        _serviceEnabled= await _location.requestService();
      }
    } on PlatformException catch (error){
      print('error code is ${error.code} and message is ${error.message}');
      _serviceEnabled = false;
      await _checkService();
    }
    return _serviceEnabled;
  }

  Future<LocationData?>  getLocation() async{
    if (await _checkPermission()){
      final locationData = _location.getLocation();
      return locationData;
    }

    return null;
  }
}