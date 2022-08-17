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

class SnapshotRequest {
  String outputPath;
  String imageType; // jpg, bmp
  SnapshotRequest({
    required this.outputPath,
    required this.imageType,
  });
}

class SearchRequest {
  // DateTime format: yyyy/MM/dd HH:mm:ss
  String timeFrom;
  // DateTime format: yyyy/MM/dd HH:mm:ss
  String timeTo;

  SearchRequest({
    required this.timeFrom,
    required this.timeTo,
  });
}

class MatchItem {
  String from;
  String to;
  String filename;
  int filesize;

  MatchItem({
    required this.from,
    required this.to,
    required this.filename,
    required this.filesize,
  });
}

// Note: pigeon does not support inheritance, so web must duplicate code here
class SearchResponse {
  String status;
  String? errorMessage;
  List<MatchItem?>? matchList;

  SearchResponse({
    this.status = 'OK',
    this.errorMessage,
    this.matchList,
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
  @ObjCSelector('getPlaybackSnapshot:')
  AccsResponse getPlaybackSnapshot(SnapshotRequest request);

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
  @ObjCSelector('searchPlaybackFilesInRange:')
  SearchResponse searchPlaybackFilesInRange(SearchRequest request);
}
