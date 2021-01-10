import 'dart:ui';

import 'package:flame/components/position_component.dart';
import 'package:flame/palette.dart';
import 'package:flame/extensions/vector2.dart';

class SquareComponent extends PositionComponent {
  Paint paint = BasicPalette.white.paint;

  SquareComponent() {
    size = Vector2.all(100.0);
  }

  @override
  void render(Canvas c) {
    super.render(c);
    c.drawRect(size.toRect(), paint);
  }
}
