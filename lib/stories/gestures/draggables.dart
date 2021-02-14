import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' show Colors;

class DraggableSquare extends PositionComponent
    with Draggable, HasGameRef<DraggablesGame> {
  @override
  bool debugMode = true;
  bool _isDragging = false;

  Vector2 dragStartPosition;
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
  bool onDragStarted(int pointerId, Vector2 startPosition) {
    dragStartPosition = startPosition;
    return false;
  }

  @override
  bool onDragUpdated(int pointerId, DragUpdateDetails details) {
    final b = gameRef
        .convertGlobalToLocalCoordinate(details.globalPosition.toVector2());
    if (!_isDragging) {
      _isDragging = true;
      dragDeltaPosition = dragStartPosition - position;
    }
    position = b - dragDeltaPosition;
    return false;
  }

  @override
  bool onDragEnded(int pointerId, DragEndDetails details) {
    _isDragging = false;
    return false;
  }

  @override
  bool onDragCanceled(int pointerId) {
    _isDragging = false;
    return false;
  }
}

class DraggablesGame extends BaseGame with HasDraggableComponents {
  @override
  Future<void> onLoad() async {
    add(DraggableSquare());
    add(DraggableSquare()..y = 350);
  }
}
