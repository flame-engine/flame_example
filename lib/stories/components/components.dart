import 'package:dashbook/dashbook.dart';
import 'package:flame/game/game_widget.dart';

import './composability.dart';
import './debug.dart';

void addComponentsStories(Dashbook dashbook) {
  dashbook
      .storiesOf('Components')
      ..add('composability', (_) => GameWidget(game: Composability()))
      ..add('debug', (_) => GameWidget(game: Debug()));
}

