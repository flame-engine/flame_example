import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' show Colors;

class DraggableSquare extends PositionComponent
    with Draggable, HasGameRef<DraggablesGame> {
  @override
  bool debugMode = true;
  bool _isDragging = false;
  Vector2 dragDeltaPosition;

  DraggableSquare({Vector2 position}) {
    size = Vector2.all(100);
    this.position = position ?? Vector2.all(100);
  }

  @override
  void update(double dt) {
    super.update(dt);
    debugColor = _isDragging ? Colors.greenAccent : Colors.purple;
  }

  @override
  bool onReceiveDrag(DragEvent event) {
    final a = event.initialPosition;
    event.onUpdate = (DragUpdateDetails details) {
      final b = gameRef
          .convertGlobalToLocalCoordinate(details.globalPosition.toVector2());
      if (!_isDragging) {
        _isDragging = true;
        dragDeltaPosition = a - position;
      }
      position = b - dragDeltaPosition;
    };
    event.onEnd = (DragEndDetails details) {
      _isDragging = false;
    };
    return true;
  }
}

class DraggablesGame extends BaseGame with HasDraggableComponents {
  @override
  Future<void> onLoad() async {
    add(DraggableSquare());
    add(DraggableSquare()..y = 350);
  }
}
