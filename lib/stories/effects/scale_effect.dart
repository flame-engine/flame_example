import 'package:flame/effects/effects.dart';
import '../../commons/square_component.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/anchor.dart';
import 'package:flame/extensions/vector2.dart';

class ScaleEffectGame extends BaseGame with TapDetector {
  SquareComponent square;
  bool grow = true;

  ScaleEffectGame() {
    add(
      square = SquareComponent()
        ..position = Vector2.all(200)
        ..anchor = Anchor.center,
    );
  }

  @override
  void onTap() {
    final s = grow ? 300.0 : 100.0;

    grow = !grow;
    square.addEffect(
      ScaleEffect(
        size: Vector2.all(s),
        speed: 250.0,
        curve: Curves.bounceInOut,
      ),
    );
  }
}
