import 'package:flutter/material.dart';
import 'package:killasters/entities/player.dart';
import 'package:killasters/scenes/app_scene.dart';
import 'package:killasters/utils/global_vars.dart';

class GameScene extends AppScene {
  Player _player = Player();
  double _startGlobalPosition = 0;

  @override
  Widget buildScene() {
    return Stack(
      children: [
        _player.build(),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: GlobalVars.screenWidth / 2,
            height: GlobalVars.screenHeight,
            decoration: BoxDecoration(border: Border.all(color: Colors.green)),
            child: GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
            ),
          ),
        )
      ],
    );
  }

  @override
  void update() {
    _player.update();
  }

  void _onPanStart(DragStartDetails details) {
    _startGlobalPosition = details.globalPosition.dx;
    print(_startGlobalPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    double updateGlobalPosition = details.globalPosition.dx;

    if (updateGlobalPosition > _startGlobalPosition + 30) {
      _player.isMoveRight = true;
    }
    if (updateGlobalPosition < _startGlobalPosition - 30) {
      _player.isMoveLeft = true;
    }
  }
}
