import 'package:flame/game.dart';
import 'package:flame_example/examples/animations.dart';
import 'package:flame_example/examples/composability.dart';

import 'examples/aseprite.dart';
import 'examples/debug.dart';

class ExampleDef {
  final String name;
  final String description;
  final Game Function() provider;

  ExampleDef(this.name, this.description, this.provider);

  static final all = [
    ExampleDef(
      'Animations',
      'Showcase the SpriteAnimationComponent',
      () => Animations(),
    ),
    ExampleDef(
      'Aseprite',
      'How to load an animation from the aseprite JSON format',
      () => Aseprite(),
    ),
    ExampleDef(
      'Composability',
      'How to organize components into parent/children relationships.',
      () => Composability(),
    ),
    ExampleDef(
      'Debug',
      'Showcase the debugMode flag and capabilities to help find issues in your games.',
      () => Debug(),
    ),
  ];

  static Map<String, Game> _gameCache = {};

  static ExampleDef findDef(String name) {
    return all.firstWhere((e) => e.name == name);
  }

  static Game findOrCreateGame(String name) {
    return _gameCache.putIfAbsent(name, findDef(name).provider);
  }
}
