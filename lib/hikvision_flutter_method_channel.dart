import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hikvision_flutter/platform_communication.dart';

import 'hikvision_flutter_platform_interface.dart';

/// An implementation of [HikvisionFlutterPlatform] that uses method channels.
class MethodChannelHikvisionFlutter extends HikvisionFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final sdk = HikvisionSdk();

  @override
  Future<AccsResponse> initSdk() async {
    var result = await sdk.initialize();
    _log(
        'initialized, result {status: ${result.status}, errorMessage: ${result.errorMessage}}');
    return result;
  }

  @override
  Future<AccsResponse> login(
      String username, String pass, String ip, String port) async {
    _log('Starting login with $username:$pass@$ip:$port');
    var result = await sdk.login(LoginRequest(
      ip: ip,
      port: int.parse(port),
      username: username,
      password: pass,
      channelNo: 0,
    ));

    // Map<String, int> map = {};
    return result;
  }

  @override
  Widget initCamera() {
    const String viewType =
        'vn.zensho.hikvision.hikvision_flutter.platformView';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};
    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  @override
  Future<AccsResponse> startLive() async {
    return await sdk.startLive();
  }

  @override
  Future<AccsResponse> stopLive() async {
    return await sdk.stopLive();
  }

  @override
  Future<AccsResponse> startPlayback(PlaybackRequest request) async {
    return await sdk.startPlayback(request);
  }

  @override
  Future<AccsResponse> pausePlayback() async {
    return await sdk.pausePlayback();
  }

  @override
  Future<AccsResponse> resumePlayback() async {
    return await sdk.resumePlayback();
  }

  @override
  Future<AccsResponse> refreshPlayback() async {
    return await sdk.refreshPlayback();
  }

  @override
  Future<AccsResponse> getPlaybackSnapshot(SnapshotRequest request) async {
    return await sdk.getPlaybackSnapshot(request);
  }

  @override
  Future<AccsResponse> playPlaybackFast() async {
    return await sdk.playPlaybackFast();
  }

  @override
  Future<AccsResponse> playPlaybackSlow() async {
    return await sdk.playPlaybackSlow();
  }

  @override
  Future<AccsResponse> playPlaybackNormalSpeed() async {
    return await sdk.playPlaybackNormalSpeed();
  }

  @override
  Future<AccsResponse> openPlaybackSound() async {
    return await sdk.openPlaybackSound();
  }

  @override
  Future<AccsResponse> closePlaybackSound() async {
    return await sdk.closePlaybackSound();
  }

  @override
  Future<AccsResponse> setPlaybackVolume(int volumePercent) async {
    return await sdk.setPlaybackVolume(volumePercent);
  }

  /// Search file in time range
  @override
  Future<SearchResponse> searchPlaybackFilesInRange(
      SearchRequest request) async {
    return await sdk.searchPlaybackFilesInRange(request);
  }

  void _log(String message) {
    debugPrint(message);
  }
}
