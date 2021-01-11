import 'package:flame/game.dart';
import 'package:flame/game/game_widget.dart';
import 'package:flutter/widgets.dart';

class DashbookGameWidget extends StatelessWidget {
  final Game game;

  DashbookGameWidget({this.game});

  @override
  Widget build(ctx) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: ClipRect(
        child: GameWidget(game: game),
      ),
    );
  }
}
