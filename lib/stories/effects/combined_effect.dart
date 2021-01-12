import 'package:flame/effects/combined_effect.dart';
import 'package:flame/effects/effects.dart';
import 'package:flame/extensions/vector2.dart';
import '../../commons/square_component.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/extensions/offset.dart';

final green = Paint()..color = const Color(0xAA338833);
final red = Paint()..color = const Color(0xAA883333);

class CombinedEffectGame extends BaseGame with TapDetector {
  SquareComponent greenSquare, redSquare;

  CombinedEffectGame() {
    greenSquare = SquareComponent()
      ..paint = green
      ..position = Vector2.all(100);

    redSquare = SquareComponent()
      ..paint = red
      ..position = Vector2.all(100);

    add(greenSquare);
    add(redSquare);
  }

  @override
  void onTapUp(TapUpDetails details) {
    greenSquare.clearEffects();
    final currentTap = details.localPosition.toVector2();

    final move = MoveEffect(
      path: [
        currentTap,
        currentTap - Vector2(50, 20),
        currentTap + Vector2.all(30),
      ],
      duration: 4.0,
      curve: Curves.bounceInOut,
      isInfinite: false,
      isAlternating: false,
    );

    final scale = ScaleEffect(
      size: currentTap,
      speed: 200.0,
      curve: Curves.linear,
      isInfinite: false,
      isAlternating: true,
    );

    final rotate = RotateEffect(
      angle: currentTap.angleTo(Vector2.all(100)),
      duration: 3,
      curve: Curves.decelerate,
      isInfinite: false,
      isAlternating: false,
    );

    final combination = CombinedEffect(
      effects: [move, rotate, scale],
      isInfinite: false,
      isAlternating: true,
      offset: 0.5,
      onComplete: () => print('onComplete callback'),
    );
    greenSquare.addEffect(combination);
  }
}