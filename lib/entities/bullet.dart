import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:killasters/entities/entity.dart';
import 'package:killasters/utils/global_vars.dart';

class Bullet extends Entity {
  final double angle;
  double x, y;

  double speed = 6;

  Bullet({this.angle, double x, double y}) : super('bullet') {
    this.x = x;
    this.y = y;
  }

  @override
  Widget build() {
    return Positioned(
      top: y,
      left: x,
      child: Transform.rotate(
        angle: angle,
        child: sprites.first,
      ),
    );
  }

  @override
  void move() {
    x += sin(angle) * speed;
    y -= cos(angle) * speed;
  }

  @override
  void update() {
    if (x > GlobalVars.screenWidth ||
        y > GlobalVars.screenHeight ||
        x < 0 ||
        y < 0) {
      visible = false;
    }
    move();
  }
}
