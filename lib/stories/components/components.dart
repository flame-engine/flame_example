import 'package:dashbook/dashbook.dart';

import './composability.dart';
import './debug.dart';
import '../../commons/dashbook_gamewidget.dart';

void addComponentsStories(Dashbook dashbook) {
  dashbook.storiesOf('Components')
    ..add(
      'composability',
      (_) => DashbookGameWidget(game: Composability()),
      codeLink:
          'https://github.com/flame-engine/flame_example/blob/master/lib/stories/components/composability.dart',
    )
    ..add(
      'debug',
      (_) => DashbookGameWidget(game: Debug()),
      codeLink:
          'https://github.com/flame-engine/flame_example/blob/master/lib/stories/components/debug.dart',
    );
}
