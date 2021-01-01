import 'package:flame/anchor.dart';
import 'package:flame/game.dart';

import '../commons/square_component.dart';

class Example2 extends BaseGame {
  @override
  Future<void> onLoad() async {
    add(
      SquareComponent()
        ..x = size.x - 10
        ..y = size.y / 2
        ..anchor = Anchor.center,
    );
  }
}
