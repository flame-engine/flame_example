import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'example_def.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String gameName;

  void chooseGame(String gameName) {
    setState(() => this.gameName = gameName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flame Examples',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: gameName == null
          ? MainMenuScreen(chooseGame: chooseGame)
          : GameScreen(gameName: gameName, chooseGame: chooseGame),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  final void Function(String) chooseGame;

  MainMenuScreen({Key key, @required this.chooseGame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: ExampleDef.all
            .map((e) => GameButton(name: e.name, chooseGame: chooseGame))
            .toList(),
      ),
    );
  }
}

class GameButton extends StatelessWidget {
  final String name;
  final void Function(String) chooseGame;

  GameButton({Key key, @required this.name, @required this.chooseGame})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: () => chooseGame(name), child: Text(name));
  }
}

class GameScreen extends StatelessWidget {
  final String gameName;
  final void Function(String) chooseGame;

  GameScreen({Key key, @required this.gameName, @required this.chooseGame})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameName),
        actions: [
          FlatButton(
            onPressed: () => chooseGame(null),
            child: Text('Back'),
          ),
        ],
      ),
      body: GameWidget(game: ExampleDef.findOrCreateGame(gameName)),
    );
  }
}
