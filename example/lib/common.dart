import 'package:flutter/material.dart';

class Constants {
  // static const String cameraIp = 'khoibv.ddns.net';
  static const String cameraIp = '192.168.1.16';
  static const int cameraPort = 8000;
  static const String cameraUsername = 'admin';
  static const String cameraPassword = 'khoibv01';
  static const int cameraChannel = 0;
}

void accsLog(String message) {
  debugPrint(message);
}
