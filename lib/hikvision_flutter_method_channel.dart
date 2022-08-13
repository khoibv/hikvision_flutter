import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'hikvision_flutter_platform_interface.dart';

/// An implementation of [HikvisionFlutterPlatform] that uses method channels.
class MethodChannelHikvisionFlutter extends HikvisionFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('hikvision_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> initSdk() async {
    final result = await methodChannel.invokeMethod<bool>('initSdk');
    return result;
  }

  @override
  Future<Map<String, int>?> login(
      String username, String pass, String ip, String port) async {
    final result = await methodChannel.invokeMethod<Map>('login',
        {"username": username, "password": pass, "ip": ip, "port": port});
    Map<String, int> map = Map.from(result!);
    return map;
  }

  @override
  Widget cameraView(String userID, String startChan) {
    const String viewType = '<platform-view-type>';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};
    creationParams['userId'] = userID;
    creationParams['startChan'] = startChan;
    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
