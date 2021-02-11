import 'package:dashbook/dashbook.dart';
import 'package:flutter/material.dart';

import 'stories/animations/animations.dart';
import 'stories/components/components.dart';
import 'stories/effects/effects.dart';
import 'stories/tile_maps/tile_maps.dart';

void main() {
  final dashbook = Dashbook();

  addAnimationStories(dashbook);
  addComponentsStories(dashbook);
  addEffectsStories(dashbook);
  addTileMapStories(dashbook);

  runApp(dashbook);
}
