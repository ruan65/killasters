import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:killasters/entities/entity.dart';

class Player extends Entity {
  Player() : super('player') {
    x = 50;
    y = 150;
  }

  @override
  Widget build() {
    return Positioned(
      child: visible ? sprites.first : SizedBox.shrink(),
      top: y,
      left: x,
    );
  }

  @override
  void move() {
    x++;
    if (x > 500) {
      x = 50;
    }
  }

  @override
  void update() {
    move();
  }
}
