import 'package:flutter/material.dart';

import 'package:dashbook/dashbook.dart';

import './stories/animations/animations.dart';
import './stories/components/components.dart';

void main() {
  final dashbook = Dashbook();

  addAnimationStories(dashbook);
  addComponentsStories(dashbook);

  runApp(dashbook);
}
