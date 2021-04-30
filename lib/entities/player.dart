import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:killasters/entities/entity.dart';
import 'package:killasters/utils/global_vars.dart';

class Player extends Entity {
  double _angle = 0;
  double _degree = 0;
  bool isMoveLeft = false;
  bool isMoveRight = false;
  double _speed = 2;

  Player() : super('player') {
    x = 50;
    y = 150;
  }

  @override
  Widget build() {
    return Positioned(
      child: visible
          ? Transform.rotate(angle: _angle, child: sprites.first)
          : SizedBox.shrink(),
      top: y,
      left: x,
    );
  }

  @override
  void move() {
    if (isMoveLeft) _degree -= 5;
    if (isMoveRight) _degree += 5;
    _angle = _degree * pi / 180;

    x += sin(_angle) * _speed;
    y -= cos(_angle) * _speed;
    if (x < 0) {
      x = 0;
    }
    if (y < 0) {
      y = 0;
    }
    if (x > GlobalVars.screenWidth - 50) {
      x = GlobalVars.screenWidth - 50;
    }
    if (y > GlobalVars.screenHeight - 50) {
      y = GlobalVars.screenHeight - 50;
    }
    isMoveRight = false;
    isMoveLeft = false;
  }

  @override
  void update() {
    move();
  }
}
