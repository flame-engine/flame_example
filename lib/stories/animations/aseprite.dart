import 'package:flame/game.dart';
import 'package:flame/sprite_animation.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/components/sprite_animation_component.dart';

// TODO(luan) this is not working on the current RC
class Aseprite extends BaseGame {
  @override
  Future<void> onLoad() async {
    final image = await images.load('animations/chopper.png');
    final jsonData = await assets.readJson('images/animations/chopper.json');
    final animation = SpriteAnimation.fromAsepriteData(image, jsonData);
    print("a4");
    final spriteSize = Vector2.all(200);
    print("a5");
    final animationComponent = SpriteAnimationComponent(spriteSize, animation)
      ..position = size / 2 - Vector2.all(100);
    add(animationComponent);
  }
}
