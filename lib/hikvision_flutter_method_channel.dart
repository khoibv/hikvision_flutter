import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hikvision_flutter/platform_communication.dart';

import 'hikvision_flutter_platform_interface.dart';

/// An implementation of [HikvisionFlutterPlatform] that uses method channels.
class MethodChannelHikvisionFlutter extends HikvisionFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final sdk = HikvisionSdk();
  // final methodChannel = const MethodChannel('hikvision_flutter');

  @override
  Future<AccsResponse> initSdk() async {
    // final result = await methodChannel.invokeMethod<bool>('initSdk');
    var result = await sdk.initialize();
    // var logContent = jsonEncode(result);
    print(
        'initialized, result {status: ${result.status}, errorMessage: ${result.errorMessage}}');
    return result;
  }

  @override
  Future<AccsResponse> login(
      String username, String pass, String ip, String port) async {
    print('Starting login with $username:$pass@$ip:$port');
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
  Widget cameraView(String userID, String startChan) {
    const String viewType =
        'vn.zensho.hikvision.hikvision_flutter.platformView';
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

  @override
  Future<AccsResponse> startLive() async {
    print('Starting live');
    return await sdk.startLive();
  }

  @override
  Future<AccsResponse> stopLive() async {
    print('Stopping live');

    return await sdk.stopLive();
  }

  @override
  Future<AccsResponse> startPlayback(PlaybackRequest request) async {
    print('Starting playback');
    return await sdk.startPlayback(request);
  }

  @override
  Future<AccsResponse> pausePlayback() async {
    print('Pause playback');

    return await sdk.pausePlayback();
  }

  @override
  Future<AccsResponse> resumePlayback() async {
    print('Resume playback');

    return await sdk.resumePlayback();
  }
}
