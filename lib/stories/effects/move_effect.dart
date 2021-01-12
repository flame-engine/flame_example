import 'package:flame/effects/effects.dart';
import 'package:flame/extensions/vector2.dart';
import '../../commons/square_component.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/extensions/offset.dart';

class MoveEffectGame extends BaseGame with TapDetector {
  SquareComponent square;

  MoveEffectGame() {
    add(
      square = SquareComponent()..position = Vector2.all(100),
    );
  }

  @override
  void onTapUp(TapUpDetails details) {
    square.addEffect(
      MoveEffect(
        path: [
          details.localPosition.toVector2(),
          Vector2(100, 100),
          Vector2(50, 120),
          Vector2(200, 400),
          Vector2(150, 0),
          Vector2(100, 300),
        ],
        speed: 250.0,
        curve: Curves.bounceInOut,
        isRelative: false,
        isInfinite: false,
        isAlternating: true,
      ),
    );
  }
}
