import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hikvision_flutter/hikvision_flutter_method_channel.dart';

void main() {
  MethodChannelHikvisionFlutter platform = MethodChannelHikvisionFlutter();
  const MethodChannel channel = MethodChannel('hikvision_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
