import 'package:dashbook/dashbook.dart';
import 'package:flame/flame.dart';
import 'package:flame/widgets.dart';
import 'package:flame_example/commons/commons.dart';
import 'package:flutter/widgets.dart';

Widget spriteWidgetBuilder(DashbookContext ctx) {
  return Container(
    width: ctx.numberProperty('container width', 400),
    height: ctx.numberProperty('container height', 200),
    child: SpriteWidget(
      sprite: Sprite(Flame.images.fromCache('shield.png')),
      anchor: parseAnchor(
        ctx.listProperty('anchor', 'Anchor.center', anchorOptions),
      ),
    ),
  );
}
