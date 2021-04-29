import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:killasters/core/game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).whenComplete(() async {
    await SystemChrome.setEnabledSystemUIOverlays([
      SystemUiOverlay.bottom,
    ]);
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Game(),
    ));
  });
}
