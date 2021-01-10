import 'package:dashbook/dashbook.dart';

import 'composability.dart';
import 'debug.dart';
import '../../commons/dashbook_gamewidget.dart';
import '../../commons/commons.dart';

void addComponentsStories(Dashbook dashbook) {
  dashbook.storiesOf('Components')
    ..add(
      'composability',
      (_) => DashbookGameWidget(game: Composability()),
      codeLink: baseLink('components/composability.dart'),
    )
    ..add(
      'debug',
      (_) => DashbookGameWidget(game: Debug()),
      codeLink: baseLink('components/debug.dart'),
    );
}
