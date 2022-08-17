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

  Widget initCamera() {
    return HikvisionFlutterPlatform.instance.initCamera();
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
    return HikvisionFlutterPlatform.instance.resumePlayback();
  }

  Future<AccsResponse> refreshPlayback() {
    return HikvisionFlutterPlatform.instance.refreshPlayback();
  }

  Future<AccsResponse> getPlaybackSnapshot(String outputPath) {
    return HikvisionFlutterPlatform.instance
        .getPlaybackSnapshot(SnapshotRequest(
      outputPath: outputPath,
      imageType: 'jpg',
    ));
  }

  Future<AccsResponse> playPlaybackFast() {
    return HikvisionFlutterPlatform.instance.playPlaybackFast();
  }

  Future<AccsResponse> playPlaybackSlow() {
    return HikvisionFlutterPlatform.instance.playPlaybackSlow();
  }

  Future<AccsResponse> playPlaybackNormalSpeed() {
    return HikvisionFlutterPlatform.instance.playPlaybackNormalSpeed();
  }

  Future<AccsResponse> openPlaybackSound() {
    return HikvisionFlutterPlatform.instance.openPlaybackSound();
  }

  Future<AccsResponse> closePlaybackSound() {
    return HikvisionFlutterPlatform.instance.closePlaybackSound();
  }

  // Future<AccsResponse> setPlaybackVolume(int volumePercent) {
  //   return HikvisionFlutterPlatform.instance.setPlaybackVolume(volumePercent);
  // }

  /// Search file in time range
  /// DateTime format: yyyy/MM/dd HH:mm:ss
  Future<SearchResponse> searchPlaybackFilesInRange(
      String fromTime, String toTime) {
    assert(fromTime.compareTo(toTime) <= 0,
        'FROM time must be less than or equals to TO time');

    return HikvisionFlutterPlatform.instance.searchPlaybackFilesInRange(
        SearchRequest(timeFrom: fromTime, timeTo: toTime));
  }
}
