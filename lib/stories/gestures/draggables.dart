import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' show Colors;

// Note: this component does not consider the possibility of multiple
// simultaneous drags with different pointerIds.
class DraggableSquare extends PositionComponent
    with Draggable, HasGameRef<DraggablesGame> {
  @override
  bool debugMode = true;

  DraggableSquare({Vector2 position}) {
    size = Vector2.all(100);
    this.position = position ?? Vector2.all(100);
  }

  Vector2 dragDeltaPosition;
  bool get isDragging => dragDeltaPosition != null;

  @override
  void update(double dt) {
    super.update(dt);
    debugColor = isDragging ? Colors.greenAccent : Colors.purple;
  }

  @override
  bool onDragStarted(int pointerId, Vector2 startPosition) {
    dragDeltaPosition = startPosition - position;
    return false;
  }

  @override
  bool onDragUpdated(int pointerId, DragUpdateDetails details) {
    final localCoords = gameRef.convertGlobalToLocalCoordinate(
      details.globalPosition.toVector2(),
    );
    position = localCoords - dragDeltaPosition;
    return false;
  }

  @override
  bool onDragEnded(int pointerId, DragEndDetails details) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  bool onDragCanceled(int pointerId) {
    dragDeltaPosition = null;
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
