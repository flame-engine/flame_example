import 'package:dashbook/dashbook.dart';
import 'package:flame/game/game_widget.dart';

import './basic.dart';
import './aseprite.dart';

void addAnimationStories(Dashbook dashbook) {
  dashbook
      .storiesOf('Animations')
      ..add('basic animations', (_) => GameWidget(game: BasicAnimations()))
      ..add('aseprite', (_) => GameWidget(game: Aseprite()));
}
