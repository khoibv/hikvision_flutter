import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hikvision_flutter/hikvision_flutter.dart';
import 'package:hikvision_flutter/hikvision_flutter_platform_interface.dart';
import 'package:hikvision_flutter/hikvision_flutter_method_channel.dart';
import 'package:hikvision_flutter/platform_communication.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHikvisionFlutterPlatform
    with MockPlatformInterfaceMixin
    implements HikvisionFlutterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<AccsResponse> login(
      String username, String pass, String ip, String port) {
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> initSdk() {
    throw UnimplementedError();
  }

  @override
  Widget initCamera() {
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> startLive() {
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> stopLive() {
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> startPlayback(PlaybackRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> pausePlayback() {
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> resumePlayback() {
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> closePlaybackSound() {
    // TODO: implement closePlaybackSound
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> getPlaybackSnapshot(SnapshotRequest request) {
    // TODO: implement getPlaybackSnapshot
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> openPlaybackSound() {
    // TODO: implement openPlaybackSound
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> playPlaybackFast() {
    // TODO: implement playPlaybackFast
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> playPlaybackNormalSpeed() {
    // TODO: implement playPlaybackNormalSpeed
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> playPlaybackSlow() {
    // TODO: implement playPlaybackSlow
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> refreshPlayback() {
    // TODO: implement refreshPlayback
    throw UnimplementedError();
  }

  @override
  Future<SearchResponse> searchPlaybackFilesInRange(SearchRequest request) {
    // TODO: implement searchPlaybackFilesInRange
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> setPlaybackVolume(int volumePercent) {
    // TODO: implement setPlaybackVolume
    throw UnimplementedError();
  }
}

void main() {
  final HikvisionFlutterPlatform initialPlatform =
      HikvisionFlutterPlatform.instance;

  test('$MethodChannelHikvisionFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHikvisionFlutter>());
  });

  test('getPlatformVersion', () async {
    HikvisionFlutter hikvisionFlutterPlugin = HikvisionFlutter();
    MockHikvisionFlutterPlatform fakePlatform = MockHikvisionFlutterPlatform();
    HikvisionFlutterPlatform.instance = fakePlatform;

    expect(await hikvisionFlutterPlugin.getPlatformVersion(), '42');
  });
}
