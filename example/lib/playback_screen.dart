import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hikvision_flutter/hikvision_flutter.dart';
import 'package:hikvision_flutter/platform_communication.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import 'common.dart';

class PlaybackScreen extends StatefulWidget {
  const PlaybackScreen({Key? key}) : super(key: key);

  @override
  State<PlaybackScreen> createState() => _PlaybackScreenState();
}

class _PlaybackScreenState extends State<PlaybackScreen> {
  GlobalKey scaffoldKey = GlobalKey();
  String _loginState = 'Unknown';
  bool isLogin = false;
  bool isPlaying = false;
  bool isPlaybackStarted = false;
  bool isPlayingSound = false;
  final _hikvisionFlutterPlugin = HikvisionFlutter();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController ipController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    ipController.text = Constants.cameraIp;
    portController.text = Constants.cameraPort.toString();
    userNameController.text = Constants.cameraUsername;
    passwordController.text = Constants.cameraPassword;
  }

  Future<void> initPlatformState() async {
    await _hikvisionFlutterPlugin.initSdk();
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Playback example'),
        ),
        body: Stack(
          children: [isLogin ? playbackForm() : loginForm()],
        ),
      ),
    );
  }

  Widget playbackForm() {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.green,
        border: Border.all(
          width: 2,
          color: Colors.red,
        ),
      ),
      constraints: const BoxConstraints.expand(height: 300),
      child: Column(children: [
        Expanded(child: _hikvisionFlutterPlugin.initCamera()),
        Row(
          children: [
            slowButton(),
            playButton(),
            fastButton(),
            soundButton(),
            screenshotButton(),
          ],
        ),
        // test panel
        Row(
          children: [
            searchButton(),
          ],
        ),
      ]),
    );
  }

  Widget playButton() {
    return TextButton.icon(
      onPressed: () async {
        if (!isPlaying) {
          // STOP => PLAY
          if (!isPlaybackStarted) {
            accsLog('Start playback from Flutter app');
            var result = await _hikvisionFlutterPlugin.startPlayback(
                PlaybackRequest(
                    timeFrom: '2022/08/15 22:00:00',
                    timeTo: '2022/08/15 23:00:00'));
            if (result.status == 'OK') {
              setState(() {
                isPlaying = true;
                isPlaybackStarted = true;
              });
            }
          } else {
            // PAUSE => RESUME
            accsLog('Resume playback from Flutter app');
            var result = await _hikvisionFlutterPlugin.resumePlayback();
            if (result.status == 'OK') {
              setState(() {
                isPlaying = true;
              });
            }
          }
        } else {
          // PLAY => STOP
          accsLog('Pause playback from Flutter app');
          var result = await _hikvisionFlutterPlugin.pausePlayback();
          if (result.status == 'OK') {
            setState(() {
              isPlaying = false;
            });
          }
        }
      },
      icon: isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
      label: isPlaying
          ? const Text('Stop')
          : (isPlaybackStarted ? const Text('Resume') : const Text('Start')),
    );
  }

  Widget slowButton() {
    return IconButton(
      icon: const Icon(Icons.fast_rewind),
      onPressed: () async {
        accsLog('Slow down from Flutter app');
        var result = await _hikvisionFlutterPlugin.playPlaybackSlow();
        if (result.status == 'OK') {
          accsLog('Slow down success');
        }
      },
    );
  }

  Widget fastButton() {
    return IconButton(
      icon: const Icon(Icons.fast_forward),
      onPressed: () async {
        accsLog('Speed up from Flutter app');
        var result = await _hikvisionFlutterPlugin.playPlaybackFast();
        if (result.status == 'OK') {
          accsLog('Speed up success');
        }
      },
    );
  }

  Widget soundButton() {
    return IconButton(
      icon: isPlayingSound
          ? const Icon(Icons.volume_up)
          : const Icon(
              Icons.volume_off,
              color: Colors.grey,
            ),
      onPressed: () async {
        if (isPlayingSound) {
          // Sound ON => OFF
          var result = await _hikvisionFlutterPlugin.closePlaybackSound();
          if (result.status == 'OK') {
            setState(() {
              isPlayingSound = false;
            });
          }
        } else {
          // Sound OFF => ON
          var result = await _hikvisionFlutterPlugin.openPlaybackSound();
          if (result.status == 'OK') {
            setState(() {
              isPlayingSound = true;
            });
          }
        }
      },
    );
  }

  Widget screenshotButton() {
    return IconButton(
      icon: const Icon(Icons.screenshot),
      onPressed: () async {
        final currentTime =
            DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
        final filename = 'hikvision_flutter_$currentTime.jpg';

        // TODO: Unable to establish connection on channel.
        // PathProviderApi.getLibraryPath (package:path_provider_ios/messages.g.dart:84:7)
        // final outputPath =
        //     '${(await getLibraryDirectory()).path}${Platform.pathSeparator}$filename';

        final outputPath =
            '/var/tmp/$filename'; // is this valid path to take snapshot?

        var result =
            await _hikvisionFlutterPlugin.getPlaybackSnapshot(outputPath);
        if (result.status == 'OK') {
          accsLog('Snapshot saved to $outputPath');
          ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
              SnackBar(content: Text('Snapshot saved to $outputPath')));

          // check saved file
          var file = File(outputPath);
          accsLog('Saved file length: ${await file.length()} (bytes)');
        }
      },
    );
  }

  Widget searchButton() {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: () async {
        accsLog('Search playback files');
        var currentDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
        var result = await _hikvisionFlutterPlugin.searchPlaybackFilesInRange(
            '$currentDate 01:00:00', '$currentDate 10:00:00');
        if (result.status == 'OK') {
          accsLog(
              'Success, result: {status: ${result.status}, errMsg: ${result.errorMessage}, matchList: ${result.matchList?.length}}');
          if (result.matchList != null && result.matchList!.isNotEmpty) {
            for (var e in result.matchList!) {
              if (e != null) {
                accsLog(
                    '${e.filename}, ${e.from} - ${e.to}, ${e.filesize} bytes');
              } else {
                accsLog('Timespan is null');
              }
            }
          } else {
            accsLog('Empty result !!!');
          }
        }
      },
    );
  }

  Widget loginForm() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Login state: $_loginState\n'),
          TextField(
            controller: userNameController,
            decoration: const InputDecoration(labelText: "User name"),
          ),
          TextField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(labelText: "Password"),
          ),
          TextField(
            controller: ipController,
            decoration: const InputDecoration(labelText: "IP"),
          ),
          TextField(
            controller: portController,
            decoration: const InputDecoration(labelText: "port"),
          ),
          TextButton(
              onPressed: () async {
                var result = await _hikvisionFlutterPlugin.login(
                    userNameController.text,
                    passwordController.text,
                    ipController.text,
                    portController.text);
                setState(() {
                  if (result.status == 'OK') {
                    _loginState = "Login success";
                    isLogin = true;
                  } else {
                    _loginState = "Login fail";
                  }
                });
              },
              child: const Text("LOGIN")),
        ],
      ),
    );
  }
}
