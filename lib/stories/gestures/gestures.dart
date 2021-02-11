import 'package:dashbook/dashbook.dart';
import 'package:flame_example/stories/gestures/mouse_movement.dart';
import 'package:flame_example/stories/gestures/multitap.dart';
import 'package:flame_example/stories/gestures/multitap_advanced.dart';
import 'package:flame_example/stories/gestures/overlapping_tapables.dart';
import 'package:flame_example/stories/gestures/scroll.dart';

import '../../commons/commons.dart';
import '../../commons/dashbook_gamewidget.dart';
import 'draggables.dart';
import 'tapables.dart';

void addGesturesStories(Dashbook dashbook) {
  dashbook.storiesOf('Gestures')
    ..add(
      'Mouse Movement',
      (_) => DashbookGameWidget(game: MouseMovementGame()),
      codeLink: baseLink('gestures/mouse_movement.dart'),
    )
    ..add(
      'Scroll',
      (_) => DashbookGameWidget(game: ScrollGame()),
      codeLink: baseLink('gestures/scroll.dart'),
    )
    ..add(
      'Multitap',
      (_) => DashbookGameWidget(game: MultitapGame()),
      codeLink: baseLink('gestures/multitap.dart'),
    )
    ..add(
      'Multitap Advanced',
      (_) => DashbookGameWidget(game: MultitapAdvancedGame()),
      codeLink: baseLink('gestures/multitap_advanced.dart'),
    )
    ..add(
      'Tappables',
      (_) => DashbookGameWidget(game: TappablesGame()),
      codeLink: baseLink('gestures/tappables.dart'),
    )
    ..add(
      'Overlaping Tappables',
      (_) => DashbookGameWidget(game: OverlappingTapablesGame()),
      codeLink: baseLink('gestures/overlaping_tappables.dart'),
    )
    ..add(
      'Draggables',
      (_) => DashbookGameWidget(game: DraggablesGame()),
      codeLink: baseLink('gestures/draggables.dart'),
    );
}
