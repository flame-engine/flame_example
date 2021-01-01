import 'package:flame/game.dart';

import '../commons/square_component.dart';

class Example1 extends BaseGame {
  @override
  Future<void> onLoad() async {
    add(
      SquareComponent()
        ..x = 100
        ..y = 200,
    );
  }
}
