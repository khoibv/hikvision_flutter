import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'hikvision_flutter_method_channel.dart';
import 'platform_communication.dart';

abstract class HikvisionFlutterPlatform extends PlatformInterface {
  /// Constructs a HikvisionFlutterPlatform.
  HikvisionFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static HikvisionFlutterPlatform _instance = MethodChannelHikvisionFlutter();

  /// The default instance of [HikvisionFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelHikvisionFlutter].
  static HikvisionFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HikvisionFlutterPlatform] when
  /// they register themselves.
  static set instance(HikvisionFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<AccsResponse> initSdk() {
    throw UnimplementedError('initSdk() has not been implemented.');
  }

  Future<AccsResponse> login(
      String username, String pass, String ip, String port) {
    throw UnimplementedError('login() has not been implemented.');
  }

  Widget initCamera() {
    throw UnimplementedError('cameraView() has not been implemented.');
  }

  Future<AccsResponse> startLive() {
    throw UnimplementedError('startLive() has not been implemented.');
  }

  Future<AccsResponse> stopLive() {
    throw UnimplementedError('stopLive() has not been implemented.');
  }

  Future<AccsResponse> startPlayback(PlaybackRequest request) {
    throw UnimplementedError('startPlayback() has not been implemented.');
  }

  Future<AccsResponse> pausePlayback() {
    throw UnimplementedError('pausePlayback() has not been implemented.');
  }

  Future<AccsResponse> resumePlayback() {
    throw UnimplementedError('resumePlayback() has not been implemented.');
  }

  Future<AccsResponse> refreshPlayback() {
    throw UnimplementedError('refreshPlayback() has not been implemented.');
  }

  Future<AccsResponse> getPlaybackSnapshot(SnapshotRequest request) {
    throw UnimplementedError('getPlaybackSnapshot() has not been implemented.');
  }

  Future<AccsResponse> playPlaybackFast() {
    throw UnimplementedError('playPlaybackFast() has not been implemented.');
  }

  Future<AccsResponse> playPlaybackSlow() {
    throw UnimplementedError('playPlaybackSlow() has not been implemented.');
  }

  Future<AccsResponse> playPlaybackNormalSpeed() {
    throw UnimplementedError(
        'playPlaybackNormalSpeed() has not been implemented.');
  }

  Future<AccsResponse> openPlaybackSound() {
    throw UnimplementedError('openPlaybackSound() has not been implemented.');
  }

  Future<AccsResponse> closePlaybackSound() {
    throw UnimplementedError('closePlaybackSound() has not been implemented.');
  }

  Future<AccsResponse> setPlaybackVolume(int volumePercent) {
    throw UnimplementedError('setPlaybackVolume() has not been implemented.');
  }

  /// Search file in time range
  Future<SearchResponse> searchPlaybackFilesInRange(SearchRequest request) {
    throw UnimplementedError(
        'searchPlaybackFilesInRange() has not been implemented.');
  }
}
