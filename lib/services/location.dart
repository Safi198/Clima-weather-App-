import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0;
  double longitude = 0;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      permission = await Geolocator.checkPermission();
      latitude=position.latitude;
      longitude=position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
