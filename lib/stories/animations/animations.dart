import 'package:dashbook/dashbook.dart';

import './basic.dart';
import './aseprite.dart';
import '../../commons/dashbook_gamewidget.dart';
import '../../commons/commons.dart';

void addAnimationStories(Dashbook dashbook) {
  dashbook.storiesOf('Animations')
    ..add(
      'basic animations',
      (_) => DashbookGameWidget(game: BasicAnimations()),
      codeLink: baseLink('animations/basic.dart'),
    )
    ..add(
      'aseprite',
      (_) => DashbookGameWidget(game: Aseprite()),
      codeLink: baseLink('animations/aseprite.dart'),
    );
}
