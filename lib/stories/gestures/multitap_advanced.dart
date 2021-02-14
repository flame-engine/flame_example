import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

/// Showcases how to mix two advanced detectors
class MultitapAdvancedGame extends BaseGame
    with MultiTouchTapDetector, MultiTouchDragDetector {
  static final _whitePaint = BasicPalette.white.paint;
  static final _size = Vector2.all(50);

  Paint _paint = _whitePaint;

  final Map<int, Rect> _taps = {};

  Vector2 _start;
  Vector2 _end;
  Rect _panRect;

  @override
  void onTapDown(int pointerId, TapDownDetails details) {
    _taps[pointerId] =
        details.globalPosition.toVector2().toPositionedRect(_size);
  }

  @override
  void onTapUp(int pointerId, _) {
    _taps.remove(pointerId);
  }

  @override
  void onTapCancel(int pointerId) {
    _taps.remove(pointerId);
  }

  @override
  void onReceiveDrag(DragEvent event) {
    onPanStart(event.initialPosition);

    event
      ..onUpdate = onPanUpdate
      ..onEnd = onPanEnd
      ..onCancel = onPanCancel;
  }

  void onPanCancel() {
    _end = null;
    _start = null;
    _panRect = null;
  }

  void onPanStart(Vector2 position) {
    _end = null;
    _start = position;
  }

  void onPanUpdate(DragUpdateDetails details) {
    _end = details.localPosition.toVector2();
  }

  void onPanEnd(DragEndDetails details) {
    if (_start != null && _end != null) {
      _panRect = Rect.fromLTRB(
        _start.x,
        _start.y,
        _end.x,
        _end.y,
      );
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _taps.values.forEach((rect) {
      canvas.drawRect(rect, _paint);
    });

    if (_panRect != null) {
      canvas.drawRect(_panRect, _paint);
    }
  }
}
