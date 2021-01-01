import 'package:flame/game.dart';
import 'package:flame_example/examples/example1.dart';
import 'package:flutter/material.dart';

import 'examples/example2.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GameButton(name: 'Example 1', chooseGame: chooseGame),
          GameButton(name: 'Example 2', chooseGame: chooseGame),
        ],
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
      body: GameWidget(game: createGame()),
    );
  }

  Game createGame() {
    switch (gameName) {
      case 'Example 1':
        return Example1();
      case 'Example 2':
        return Example2();
    }
    throw 'Invalid example...';
  }
}
