import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:killasters/core/main_loop.dart';
import 'package:killasters/entities/player.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  ReceivePort _receivePort;
  Isolate _isolateLoop;

  Player player;

  void startIsolateLoop() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort.sendPort);
    _receivePort.listen((message) {
      player.update();
      setState(() {});
    });
  }

  @override
  void initState() {
    startIsolateLoop();
    player = Player();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        player.build(),
      ],
    );
  }
}
