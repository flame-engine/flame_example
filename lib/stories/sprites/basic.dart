import 'package:flame/components.dart';
import 'package:flame/game.dart';

class BasicSpriteGame extends BaseGame {
  @override
  Future<void> onLoad() async {
    final sprite = await loadSprite('flame.png');
    add(
      SpriteComponent.fromSprite(sprite.srcSize * 2, sprite)
        ..position = Vector2.all(100),
    );
  }
}
