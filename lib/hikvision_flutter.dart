import 'package:flutter/widgets.dart';

import 'hikvision_flutter_platform_interface.dart';

class HikvisionFlutter {
  Future<String?> getPlatformVersion() {
    return HikvisionFlutterPlatform.instance.getPlatformVersion();
  }

  Future<bool?> initSdk() {
    return HikvisionFlutterPlatform.instance.initSdk();
  }

  Future<Map<String, int>?> login(
      String username, String pass, String ip, String port) {
    return HikvisionFlutterPlatform.instance.login(username, pass, ip, port);
  }

  Widget cameraView(String userID, String startChan) {
    return HikvisionFlutterPlatform.instance.cameraView(userID, startChan);
  }
}
