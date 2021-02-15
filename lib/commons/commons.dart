import 'package:flame/components.dart';

String baseLink(String path) {
  const _basePath =
      'https://github.com/flame-engine/flame_example/blob/master/lib/stories/';

  return '$_basePath$path';
}

// TODO(luan) clean this up!

final anchorOptions = [
  'Anchor.topLeft',
  'Anchor.topCenter',
  'Anchor.topRight',
  'Anchor.centerLeft',
  'Anchor.center',
  'Anchor.centerRight',
  'Anchor.bottomLeft',
  'Anchor.bottomCenter',
  'Anchor.bottomRight',
];

Anchor parseAnchor(String name) {
  switch (name) {
    case 'Anchor.topLeft':
      return Anchor.topLeft;
    case 'Anchor.topCenter':
      return Anchor.topCenter;
    case 'Anchor.topRight':
      return Anchor.topRight;
    case 'Anchor.centerLeft':
      return Anchor.centerLeft;
    case 'Anchor.center':
      return Anchor.center;
    case 'Anchor.centerRight':
      return Anchor.centerRight;
    case 'Anchor.bottomLeft':
      return Anchor.bottomLeft;
    case 'Anchor.bottomCenter':
      return Anchor.bottomCenter;
    case 'Anchor.bottomRight':
      return Anchor.bottomRight;
  }

  throw Exception('Cannot parse anchor name `$name`');
}
