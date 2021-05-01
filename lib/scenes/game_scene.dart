import 'package:flutter/material.dart';
import 'package:killasters/entities/bullet.dart';
import 'package:killasters/entities/player.dart';
import 'package:killasters/scenes/app_scene.dart';
import 'package:killasters/utils/global_vars.dart';

class GameScene extends AppScene {
  Player _player = Player();
  double _startGlobalPosition = 0;
  List<Bullet> _bullets = [];
  List<Widget> _widgets = [];

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
            child: GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: GlobalVars.screenWidth / 2,
          child: Container(
            width: GlobalVars.screenWidth / 2,
            height: GlobalVars.screenHeight / 2,
            child: GestureDetector(
              onTap: _acceleration,
            ),
          ),
        ),
        Positioned(
          top: GlobalVars.screenHeight / 2,
          left: GlobalVars.screenWidth / 2,
          child: Container(
            width: GlobalVars.screenWidth / 2,
            height: GlobalVars.screenHeight / 2,
            child: GestureDetector(
              onTap: _onShoot,
            ),
          ),
        ),
        ..._widgets,
      ],
    );
  }

  @override
  void update() {
    _widgets.clear();
    _player.update();
    _bullets.removeWhere((bullet) => !bullet.visible);
    _bullets.forEach((bullet) {
      _widgets.add(bullet.build());
      bullet.update();
    });
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

  void _acceleration() {
    _player.accelerate = !_player.accelerate;
  }

  void _onShoot() {
    _bullets.add(Bullet(angle: _player.angle, x: _player.x, y: _player.y));
  }
}
