import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hikvision_flutter/hikvision_flutter.dart';
import 'package:hikvision_flutter_example/common.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  String _loginState = 'Unknown';
  bool isLogin = false;
  bool isPlaying = false;
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
        appBar: AppBar(
          title: const Text('Live example'),
        ),
        body: Stack(
          children: [isLogin ? liveForm() : loginForm()],
        ),
      ),
    );
  }

  Widget liveForm() {
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
        TextButton(
          onPressed: () async {
            if (!isPlaying) {
              // STOP => PLAY
              accsLog('Start live from Flutter app');
              var result = await _hikvisionFlutterPlugin.startLive();
              if (result.status == 'OK') {
                setState(() {
                  isPlaying = true;
                });
              }
            } else {
              // PLAY => STOP
              accsLog('Stop live from Flutter app');
              var result = await _hikvisionFlutterPlugin.stopLive();
              if (result.status == 'OK') {
                setState(() {
                  isPlaying = false;
                });
              }
            }
          },
          child: isPlaying ? const Text('Stop') : const Text('Start'),
        ),
      ]),
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
