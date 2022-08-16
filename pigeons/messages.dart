import 'package:pigeon/pigeon.dart';

class LoginRequest {
  String ip;
  int port;
  String username;
  String password;
  int channelNo;

  LoginRequest({
    required this.ip,
    required this.port,
    required this.username,
    required this.password,
    required this.channelNo,
  });
}

class AccsResponse {
  String status;
  String? errorMessage;
  AccsResponse({
    this.status = 'OK',
    this.errorMessage,
  });
}

class PlaybackRequest {
  /// format: yyyy/MM/dd HH:mm:ss
  String timeFrom;
  String timeTo;

  PlaybackRequest({
    required this.timeFrom,
    required this.timeTo,
  });
}

@HostApi()
abstract class HikvisionSdk {
  // ===============================
  // COMMON FUNCTIONS
  // ===============================
  @async
  @ObjCSelector('initialize')
  AccsResponse initialize();

  @async
  @ObjCSelector('login:')
  AccsResponse login(LoginRequest request);

  @async
  @ObjCSelector('logout')
  AccsResponse logout();

  // ===============================
  // LIVE FUNCTIONS
  // ===============================
  @async
  @ObjCSelector('startLive')
  AccsResponse startLive();

  @async
  @ObjCSelector('stopLive')
  AccsResponse stopLive();

  // ===============================
  // PLAYBACK FUNCTIONS
  // ===============================

  @async
  @ObjCSelector('startPlayback:')
  AccsResponse startPlayback(PlaybackRequest request);

  // @async
  // @ObjCSelector('stopPlayback')
  // AccsResponse stopPlayback();

  @async
  @ObjCSelector('pausePlayback')
  AccsResponse pausePlayback();
  @async
  @ObjCSelector('resumePlayback')
  AccsResponse resumePlayback();

  @async
  @ObjCSelector('refreshPlayback')
  AccsResponse refreshPlayback();

  @async
  @ObjCSelector('getPlaybackSnapshot')
  AccsResponse getPlaybackSnapshot();

  @async
  @ObjCSelector('playPlaybackFast')
  AccsResponse playPlaybackFast();
  @async
  @ObjCSelector('playPlaybackSlow')
  AccsResponse playPlaybackSlow();
  @async
  @ObjCSelector('playPlaybackNormalSpeed')
  AccsResponse playPlaybackNormalSpeed();

  @async
  @ObjCSelector('openPlaybackSound')
  AccsResponse openPlaybackSound();
  @async
  @ObjCSelector('closePlaybackSound')
  AccsResponse closePlaybackSound();
  @async
  @ObjCSelector('setPlaybackVolume:')
  AccsResponse setPlaybackVolume(int volumePercent);

  /// Search file in time range
  /// DateTime format: yyyy/MM/dd HH:mm:ss
  @async
  @ObjCSelector('searchPlaybackFilesInRange:to:')
  AccsResponse searchPlaybackFilesInRange(String fromTime, String toTime);
}
