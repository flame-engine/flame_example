import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/joystick.dart';
import 'package:flame/extensions.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

final _whitePaint = BasicPalette.white.paint;
final _bluePaint = Paint()..color = const Color(0xFF0000FF);
final _greenPaint = Paint()..color = const Color(0xFF00FF00);

class Player extends Component implements JoystickListener {
  static const speed = 32.0;

  double currentSpeed = 0;
  double radAngle = 0;
  bool _move = false;
  Paint _paint;
  Rect _rect;

  Player() {
    _paint = _whitePaint;
  }

  @override
  void render(Canvas canvas) {
    if (_rect == null) {
      return;
    }
    canvas.translate(_rect.center.dx, _rect.center.dy);
    canvas.rotate(radAngle == 0.0 ? 0.0 : radAngle + (pi / 2));
    canvas.translate(-_rect.center.dx, -_rect.center.dy);
    canvas.drawRect(_rect, _paint);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_move) {
      moveFromAngle(dt);
    }
  }

  @override
  void onGameResize(Vector2 size) {
    _rect = Rect.fromLTWH(
      (size.x / 2) - 25,
      (size.y / 2) - 25,
      50,
      50,
    );
    super.onGameResize(size);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN) {
      if (event.id == 1) {
        _paint = _paint == _whitePaint ? _bluePaint : _whitePaint;
      }
      if (event.id == 2) {
        _paint = _paint == _whitePaint ? _greenPaint : _whitePaint;
      }
    }
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    _move = event.directional != JoystickMoveDirectional.IDLE;
    if (_move) {
      radAngle = event.radAngle;
      currentSpeed = speed * event.intensity;
    }
  }

  void moveFromAngle(double dtUpdate) {
    if (_rect == null) {
      return;
    }

    final next =
        Vector2(cos(radAngle), sin(radAngle)) * (currentSpeed * dtUpdate);
    _rect = _rect.shift(next.toOffset());
  }
}

class JoystickGame extends BaseGame with HasDraggableComponents {
  @override
  Future<void> onLoad() async {
    final joystick = JoystickComponent(
      gameRef: this,
      directional: JoystickDirectional(),
      actions: [
        JoystickAction(
          actionId: 1,
          size: 50,
          margin: const EdgeInsets.all(50),
          color: const Color(0xFF0000FF),
        ),
        JoystickAction(
          actionId: 2,
          size: 50,
          color: const Color(0xFF00FF00),
          margin: const EdgeInsets.only(
            right: 50,
            bottom: 120,
          ),
        ),
        JoystickAction(
          actionId: 3,
          size: 50,
          margin: const EdgeInsets.only(bottom: 50, right: 120),
          enableDirection: true,
        ),
      ],
    );

    final player = Player();
    joystick.addObserver(player);

    add(player);
    add(joystick);
  }
}
