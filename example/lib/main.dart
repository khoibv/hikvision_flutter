import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hikvision_flutter/hikvision_flutter.dart';
import 'package:hikvision_flutter/platform_communication.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _loginState = 'Unknown';
  bool isLogin = false;
  bool isPlaying = false;
  bool isPlaybackStarted = false;
  String userID = "";
  String startChan = "";
  final _hikvisionFlutterPlugin = HikvisionFlutter();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController ipController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    portController.text = "8000";
    ipController.text = "khoibv.ddns.net";
    passwordController.text = "khoibv01";
    userNameController.text = "admin";
  }

  Future<void> initPlatformState() async {
    await _hikvisionFlutterPlugin.initSdk();
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Stack(
          children: [
            isLogin
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        width: 2,
                        color: Colors.red,
                      ),
                    ),
                    constraints: const BoxConstraints.expand(height: 300),
                    child: Column(children: [
                      Expanded(
                          child: _hikvisionFlutterPlugin.cameraView(
                              userID, startChan)),
                      TextButton(
                        onPressed: () async {
                          if (!isPlaying) {
                            // STOP => PLAY
                            if (!isPlaybackStarted) {
                              var result = await _hikvisionFlutterPlugin
                                  .startPlayback(PlaybackRequest(
                                      timeFrom: '2022/08/15 10:00:00',
                                      timeTo: '2022/08/15 12:00:00'));
                              if (result.status == 'OK') {
                                setState(() {
                                  isPlaying = true;
                                  isPlaybackStarted = true;
                                });
                              }
                            } else {
                              // PAUSE => RESUME
                              var result = await _hikvisionFlutterPlugin
                                  .resumePlayback();
                              if (result.status == 'OK') {
                                isPlaying = true;
                              }
                            }
                          } else {
                            // PLAY => STOP
                            var result =
                                await _hikvisionFlutterPlugin.pausePlayback();
                            if (result.status == 'OK') {
                              setState(() {
                                isPlaying = false;
                              });
                            }
                          }
                        },
                        child: isPlaying
                            ? const Text('Stop playback')
                            : const Text('Start playback'),
                      ),
                    ]),
                  )
                : Container(),
            !isLogin
                ? Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text('Login state: $_loginState\n'),
                        TextField(
                          controller: userNameController,
                          decoration:
                              const InputDecoration(labelText: "User name"),
                        ),
                        TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration:
                              const InputDecoration(labelText: "Password"),
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
                                  // userID = result["userID"].toString();
                                  // startChan = result["startChan"].toString();
                                  isLogin = true;
                                } else {
                                  _loginState = "Login fail";
                                }
                              });
                            },
                            child: const Text("LOGIN")),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
