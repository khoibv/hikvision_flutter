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
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> initSdk() {
    // TODO: implement initSdk
    throw UnimplementedError();
  }

  @override
  Widget cameraView(String userID, String startChan) {
    // TODO: implement cameraView
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> startLive() {
    // TODO: implement startLive
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> stopLive() {
    // TODO: implement stopLive
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> startPlayback(PlaybackRequest request) {
    // TODO: implement startPlayback
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> pausePlayback() {
    // TODO: implement pausePlayback
    throw UnimplementedError();
  }

  @override
  Future<AccsResponse> resumePlayback() {
    // TODO: implement resumePlayback
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
