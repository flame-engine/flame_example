import 'dart:math';

import 'package:flame/effects/effects.dart';
import 'package:flame/extensions/vector2.dart';
import '../../commons/square_component.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';

final green = Paint()..color = Color(0xAA338833);
final red = Paint()..color = Color(0xAA883333);
final orange = Paint()..color = Color(0xAABB6633);

SquareComponent makeSquare(Paint paint) {
  return SquareComponent()
    ..paint = paint
    ..position = Vector2.all(100);
}

class InfiniteEffectGame extends BaseGame with TapDetector {
  SquareComponent greenSquare;
  SquareComponent redSquare;
  SquareComponent orangeSquare;

  InfiniteEffectGame()
      : greenSquare = makeSquare(green),
        redSquare = makeSquare(red),
        orangeSquare = makeSquare(orange) {
    add(greenSquare);
    add(redSquare);
    add(orangeSquare);
  }

  @override
  void onTapUp(TapUpDetails details) {
    final dx = details.localPosition.dx;
    final dy = details.localPosition.dy;

    greenSquare.clearEffects();
    redSquare.clearEffects();
    orangeSquare.clearEffects();

    greenSquare.addEffect(
      MoveEffect(
        path: [Vector2(dx, dy)],
        speed: 250.0,
        curve: Curves.bounceInOut,
        isInfinite: true,
        isAlternating: true,
      ),
    );

    redSquare.addEffect(
      ScaleEffect(
        size: Vector2(dx, dy),
        speed: 250.0,
        curve: Curves.easeInCubic,
        isInfinite: true,
        isAlternating: true,
      ),
    );

    orangeSquare.addEffect(
      RotateEffect(
        angle: (dx + dy) % (2 * pi),
        speed: 1.0, // Radians per second
        curve: Curves.easeInOut,
        isInfinite: true,
        isAlternating: true,
      ),
    );
  }
}
