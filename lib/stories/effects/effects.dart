import 'package:dashbook/dashbook.dart';
import 'package:flame/game/game_widget.dart';
import 'rotate_effect.dart';
import 'scale_effect.dart';
import 'sequence_effect.dart';

import 'combined_effect.dart';
import 'infinite_effect.dart';
import 'move_effect.dart';

void addEffectsStories(Dashbook dashbook) {
  dashbook.storiesOf('Effects')
    ..add('Scale Effect', (_) => GameWidget(game: ScaleEffectGame()))
    ..add('Move Effect', (_) => GameWidget(game: MoveEffectGame()))
    ..add('Rotate Effect', (_) => GameWidget(game: RotateEffectGame()))
    ..add('Sequence Effect', (_) => GameWidget(game: SequenceEffectGame()))
    ..add('Combined Effect', (_) => GameWidget(game: CombinedEffectGame()))
    ..add('Infinite Effect', (_) => GameWidget(game: InfiniteEffectGame()));
}
