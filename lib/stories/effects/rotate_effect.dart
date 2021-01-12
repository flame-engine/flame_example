import 'dart:math';

import 'package:flame/effects/effects.dart';
import 'package:flame/extensions/vector2.dart';
import '../../commons/square_component.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/anchor.dart';

class RotateEffectGame extends BaseGame with TapDetector {
  SquareComponent square;

  RotateEffectGame() {
    add(
      square = SquareComponent()
        ..position = Vector2.all(200)
        ..anchor = Anchor.center,
    );
  }

  @override
  void onTap() {
    square.addEffect(
      RotateEffect(
        angle: 2 * pi,
        isRelative: true,
        duration: 5.0,
        curve: Curves.bounceInOut,
      ),
    );
  }
}
