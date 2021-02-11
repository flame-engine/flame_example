import 'package:flame/components.dart';
import 'package:flame/game.dart';

class Aseprite extends BaseGame {
  @override
  Future<void> onLoad() async {
    final image = await images.load('animations/chopper.png');
    final jsonData = await assets.readJson('images/animations/chopper.json');
    final animation = SpriteAnimation.fromAsepriteData(image, jsonData);
    final spriteSize = Vector2.all(200);
    final animationComponent =
        SpriteAnimationComponent.fromSpriteAnimation(spriteSize, animation)
          ..position = size / 2 - Vector2.all(100);
    add(animationComponent);
  }
}
