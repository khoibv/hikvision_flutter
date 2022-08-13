import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hikvision_flutter/hikvision_flutter.dart';

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
                ? _hikvisionFlutterPlugin.cameraView(userID, startChan)
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
                                if (result != null && result.isNotEmpty) {
                                  _loginState = "Login success";
                                  userID = result["userID"].toString();
                                  startChan = result["startChan"].toString();
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
