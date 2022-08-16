import 'package:flutter/widgets.dart';
import 'package:hikvision_flutter/platform_communication.dart';

import 'hikvision_flutter_platform_interface.dart';

class HikvisionFlutter {
  Future<String?> getPlatformVersion() {
    return HikvisionFlutterPlatform.instance.getPlatformVersion();
  }

  Future<AccsResponse> initSdk() {
    return HikvisionFlutterPlatform.instance.initSdk();
  }

  Future<AccsResponse> login(
      String username, String pass, String ip, String port) {
    return HikvisionFlutterPlatform.instance.login(username, pass, ip, port);
  }

  Widget cameraView(String userID, String startChan) {
    return HikvisionFlutterPlatform.instance.cameraView(userID, startChan);
  }

  Future<AccsResponse> startLive() {
    return HikvisionFlutterPlatform.instance.startLive();
  }

  Future<AccsResponse> stopLive() {
    return HikvisionFlutterPlatform.instance.stopLive();
  }

  Future<AccsResponse> startPlayback(PlaybackRequest request) {
    return HikvisionFlutterPlatform.instance.startPlayback(request);
  }

  Future<AccsResponse> pausePlayback() {
    return HikvisionFlutterPlatform.instance.pausePlayback();
  }

  Future<AccsResponse> resumePlayback() {
    return HikvisionFlutterPlatform.instance.pausePlayback();
  }
}
