import 'dart:ui';

import 'package:flame/components/sprite_animation_component.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite_animation.dart';
import 'package:flutter/gestures.dart' show TapDownDetails;

class Animations extends BaseGame with TapDetector {
  Image chopper;
  Image creature;
  SpriteAnimation animation;

  @override
  Future<void> onLoad() async {
    chopper = await images.load('animations/chopper.png');
    creature = await images.load('animations/creature.png');

    animation = SpriteAnimation.fromFrameData(
      chopper,
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(48),
        stepTime: 0.15,
        loop: true,
      ),
    );

    final spriteSize = Vector2.all(100.0);
    final animationComponent2 = SpriteAnimationComponent(spriteSize, animation);
    animationComponent2.x = size.x / 2 - spriteSize.x;
    animationComponent2.y = spriteSize.y;

    final reversedAnimationComponent = SpriteAnimationComponent(
      spriteSize,
      animation.reversed(),
    );
    reversedAnimationComponent.x = size.x / 2;
    reversedAnimationComponent.y = spriteSize.y;

    add(animationComponent2);
    add(reversedAnimationComponent);
  }

  void addAnimation(Vector2 position) {
    final size = Vector2(291, 178);

    final animationComponent = SpriteAnimationComponent.fromFrameData(
      size,
      creature,
      SpriteAnimationData.sequenced(
        amount: 18,
        amountPerRow: 10,
        textureSize: size,
        stepTime: 0.15,
        loop: false,
      ),
      removeOnFinish: true,
    );

    animationComponent.position = position;
    animationComponent.position = animationComponent.position - size / 2;
    add(animationComponent);
  }

  @override
  void onTapDown(TapDownDetails evt) {
    addAnimation(Vector2(evt.globalPosition.dx, evt.globalPosition.dy));
  }
}
