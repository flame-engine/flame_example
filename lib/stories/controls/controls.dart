import 'package:dashbook/dashbook.dart';

import '../../commons/commons.dart';
import '../../commons/dashbook_gamewidget.dart';
import 'draggables.dart';
import 'joystick.dart';
import 'keyboard.dart';
import 'mouse_movement.dart';
import 'multitap.dart';
import 'multitap_advanced.dart';
import 'overlapping_tapables.dart';
import 'scroll.dart';
import 'tapables.dart';

void addControlsStories(Dashbook dashbook) {
  dashbook.storiesOf('Controls')
    ..add(
      'Keyboard',
      (_) => DashbookGameWidget(game: KeyboardGame()),
      codeLink: baseLink('gestures/keyboard.dart'),
    )
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
      'Tapables',
      (_) => DashbookGameWidget(game: TapablesGame()),
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
    )
    ..add(
      'Joystick',
      (_) => DashbookGameWidget(game: JoystickGame()),
      codeLink: baseLink('gestures/joystick.dart'),
    );
}
