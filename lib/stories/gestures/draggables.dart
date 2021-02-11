import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' show Colors;

// TODO(luan) doesn't work because it considers absolute units, need to rethink also I think the api can be improved
class DraggableSquare extends PositionComponent with Draggable {
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
    event.onUpdate = (DragUpdateDetails details) {
      if (!_isDragging) {
        _isDragging = true;
        dragDeltaPosition = event.initialPosition.toVector2() - position;
      }
      position = details.localPosition.toVector2() - dragDeltaPosition;
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
    add(DraggableSquare()..anchor = Anchor.topLeft);
    add(DraggableSquare()..y = 350);
  }
}
