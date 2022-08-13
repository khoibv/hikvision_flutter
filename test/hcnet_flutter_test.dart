import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hikvision_flutter/hikvision_flutter.dart';
import 'package:hikvision_flutter/hikvision_flutter_platform_interface.dart';
import 'package:hikvision_flutter/hikvision_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHcnetFlutterPlatform
    with MockPlatformInterfaceMixin
    implements HikvisionFlutterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<Map<String, int>?> login(
      String username, String pass, String ip, String port) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<bool?> initSdk() {
    // TODO: implement initSdk
    throw UnimplementedError();
  }

  @override
  Widget cameraView(String userID, String startChan) {
    // TODO: implement cameraView
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
    MockHcnetFlutterPlatform fakePlatform = MockHcnetFlutterPlatform();
    HikvisionFlutterPlatform.instance = fakePlatform;

    expect(await hikvisionFlutterPlugin.getPlatformVersion(), '42');
  });
}
