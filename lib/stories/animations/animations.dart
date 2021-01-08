import 'package:dashbook/dashbook.dart';

import './basic.dart';
import './aseprite.dart';
import '../../commons/dashbook_gamewidget.dart';

void addAnimationStories(Dashbook dashbook) {
  dashbook.storiesOf('Animations')
    ..add(
      'basic animations',
      (_) => DashbookGameWidget(game: BasicAnimations()),
      codeLink:
          'https://github.com/flame-engine/flame_example/blob/master/lib/stories/animations/basic.dart',
    )
    ..add(
      'aseprite',
      (_) => DashbookGameWidget(game: Aseprite()),
      codeLink:
          'https://github.com/flame-engine/flame_example/blob/master/lib/stories/animations/aseprite.dart',
    );
}
