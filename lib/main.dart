import 'dart:async';

import 'package:colormemory/login_signup_page.dart';
import 'package:colormemory/services/authentication.dart';
import 'package:colormemory/utils/memoryColor.dart';
import 'package:colormemory/widgets/boutons.dart';
import 'package:colormemory/widgets/registration.dart';
import 'package:colormemory/widgets/signin.dart';
import 'package:flutter/material.dart';
import 'package:colormemory/color/colorsPossibilities.dart';
import 'package:flutter/services.dart';
import 'dart:math' as Math;
import 'package:colormemory/widgets/home.dart';
import 'package:colormemory/utils/constants.dart';
import 'package:colormemory/widgets/startStopButton.dart';
import 'package:random_color/random_color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  BaseAuth auth;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE_TEXT,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Color Memory'),
      // home: Home(),
      // home: SignUpScreen(this.auth),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SignInScreen(),
        '/registration': (context) => SignUpScreen(this.auth),
        '/home': (context) => HomeWithMenu()
        // '/forgot-password': (context) => ForgotPasswordScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  int niveau = 0;
  int vie = 5;
  int _counter = 0;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorTween;
  int niveau = 0;
  Widget _button;
  double _greenOpacity = 1.0;
  double _redOpacity = 1.0;
  double _yellowOpacity = 1.0;
  double _blueOpacity = 1.0;
  bool _result = false;
  String _gameLabel = '';
  List<int> _colorMemorySequence = [];
  List<int> _userSequence = [];

  bool _visible = true;
  Timer _timer;

  @override
  void initState() {

    super.initState();
    initStartStopButton();
  }

  @override
  void dispose() {
    super.dispose();
    // _animationController.dispose();
  }

  void initStartStopButton() {
    if (niveau == 0) {
      _button = StartStopButtonClass(
          label: 'Commencer',
          onTap: () {
            setState(() {
              _result = true;
              niveau += 1;
              _userSequence.clear();
              _colorMemorySequence.add(Math.Random().nextInt(4) + 1);
              playSequence(_colorMemorySequence);
              initStartStopButton();
            });
          }).startStopButton();
    } else if (niveau > 0) {
      _button = StartStopButtonClass(
          label: 'Arrêter',
          onTap: () {
            setState(() {
              stopSequence();
              _result = false;
              niveau = 0;
              _gameLabel = '';
              _colorMemorySequence.clear();
              _userSequence.clear();
              initStartStopButton();
            });
          }).startStopButton();
    }
  }

  void changeCouleur(OpacityColor color) {
    switch (color) {
      case OpacityColor.green:
        setState(() {
          _greenOpacity = _greenOpacity == 1.0 ? 0.0 : 1.0;
        });

        Future.delayed(kDelayedOpacityDuration, () {
          setState(() {
            _greenOpacity = _greenOpacity == 0.0 ? 1.0 : 0.0;
          });
        });
        break;
      case OpacityColor.red:
        setState(() {
          _redOpacity = _redOpacity == 1.0 ? 0.0 : 1.0;
        });

        Future.delayed(kDelayedOpacityDuration, () {
          setState(() {
            _redOpacity = _redOpacity == 0.0 ? 1.0 : 0.0;
          });
        });
        break;
      case OpacityColor.yellow:
        setState(() {
          _yellowOpacity = _yellowOpacity == 1.0 ? 0.0 : 1.0;
        });

        Future.delayed(kDelayedOpacityDuration, () {
          setState(() {
            _yellowOpacity = _yellowOpacity == 0.0 ? 1.0 : 0.0;
          });
        });
        break;
      case OpacityColor.blue:
        setState(() {
          _blueOpacity = _blueOpacity == 1.0 ? 0.0 : 1.0;
        });

        Future.delayed(kDelayedOpacityDuration, () {
          setState(() {
            _blueOpacity = _blueOpacity == 0.0 ? 1.0 : 0.0;
          });
        });
        break;
    }
  }

  void colormemoryPlay(int index, OpacityColor opacityColor) {
    Future.delayed(Duration(milliseconds: index * 500), () {
      changeCouleur(opacityColor);
    });
  }

  void playSequence(List<int> colorMemorySequence) {
    for (var i = 0; i < colorMemorySequence.length; i++) {
      switch (colorMemorySequence[i]) {
        case 1:
          colormemoryPlay(i, OpacityColor.green);
          break;
        case 2:
          colormemoryPlay(i, OpacityColor.red);
          break;
        case 3:
          colormemoryPlay(i, OpacityColor.yellow);
          break;
        case 4:
          colormemoryPlay(i, OpacityColor.blue);
          break;
      }
    }
  }

  void stopSequence() {}
  void sequenceSuivant() {
    setState(() {
      _userSequence.clear();
      _result = true;
      niveau++;
      _colorMemorySequence.add(Math.Random().nextInt(4) + 1);
    });

    Future.delayed(Duration(seconds: 1), () {
      playSequence(_colorMemorySequence);
    });
  }

  void startSequence(List<int> sequence) {}

  bool checkSeqeunce() {
    int count = 0;
    for (var sq in _colorMemorySequence) {
      for (var i = count; i < _userSequence.length;) {
        if (sq != _userSequence[i]) {
          return false;
        } else {
          count++;
          break;
        }
      }
      continue;
    }
    return true;
  }

  void gameOver() {
    setState(() {
      _result = false;
      niveau = 0;
      _gameLabel = 'Perdu';
      _colorMemorySequence.clear();
      _userSequence.clear();
      initStartStopButton();
    });
  }

  Widget _lifeWidget(BuildContext context) {
    return RichText(
        text: TextSpan(
            // set the default style for the children TextSpans
            style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18),
            children: [
          TextSpan(
              text: getLife_Text(),
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
        ]));
  }

  String getLife_Text() {
    String life_text = "";
    for (var i = 0; i < MyHomePage().vie; i++) {
      life_text += "♥︎";
    }
    return life_text;
  }

  Widget _levelWidget(int value, BuildContext context) {
    return RichText(
        text: TextSpan(
            // set the default style for the children TextSpans
            style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18),
            children: [
          TextSpan(
            text: LEVEL_TEXT,
          ),
          TextSpan(
              text: value.toString(),
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    // ColorsPossibilities colorsPossibilities = new ColorsPossibilities();
    // return colorsPossibilities.colorX(context, 4);
    print("The button= ${MediaQuery.of(context).size.width}");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(64, 75, 96, .9),
          title: Text('Color Memory'),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(children: [
                _result ? (niveau == 0 ? Text("Niveau") :
                //  _levelWidget(niveau ,context)
                 Container(
                  alignment: Alignment.topLeft,
                  child: _levelWidget(niveau, context),
                )
                 
                 ): Container(
                  alignment: Alignment.topLeft,
                  child: _levelWidget(niveau, context),
                ),
                
                Container(
                  alignment: Alignment.topRight,
                  child: _lifeWidget(context),
                )
              ]
                  ),

              Text(
                '${_result ? (niveau == 0 ? '' : ' ') : _gameLabel}',
                style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              kHeightSpacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedOpacity(
                    duration: kAnimatedOpacityDuration,
                    opacity: _greenOpacity,
                    child: BoutonColor(
                      color: Colors.green,
                      onPressed: () {
                        _userSequence.add(1);
                        changeCouleur(OpacityColor.green);
                        // Simon.play(SimonColor.green);
                        if (_colorMemorySequence.length ==
                            _userSequence.length) {
                          setState(() {
                            _result = checkSeqeunce();
                            if (_result)
                              sequenceSuivant();
                            else
                              gameOver();
                          });
                        }
                      },
                    ).getDecoration(),
                  ),
                  kWidthSpacer,
                  AnimatedOpacity(
                    duration: kAnimatedOpacityDuration,
                    opacity: _redOpacity,
                    child: BoutonColor(
                      color: Colors.red,
                      onPressed: () {
                        _userSequence.add(2);
                        changeCouleur(OpacityColor.red);
                        // Simon.play(SimonColor.red);
                        if (_colorMemorySequence.length ==
                            _userSequence.length) {
                          setState(() {
                            _result = checkSeqeunce();
                            if (_result)
                              sequenceSuivant();
                            else
                              gameOver();
                          });
                        }
                      },
                    ).getDecoration(),
                  ),
                ],
              ),
              kHeightSpacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedOpacity(
                    duration: kAnimatedOpacityDuration,
                    opacity: _yellowOpacity,
                    child: BoutonColor(
                      color: Colors.yellow,
                      onPressed: () {
                        _userSequence.add(3);
                        changeCouleur(OpacityColor.yellow);
                        // Simon.play(SimonColor.yellow);
                        if (_colorMemorySequence.length ==
                            _userSequence.length) {
                          _result = checkSeqeunce();
                          if (_result)
                            sequenceSuivant();
                          else
                            gameOver();
                        }
                      },
                    ).getDecoration(),
                  ),
                  kWidthSpacer,
                  AnimatedOpacity(
                    duration: kAnimatedOpacityDuration,
                    opacity: _blueOpacity,
                    child: BoutonColor(
                      color: Colors.blue,
                      onPressed: () {
                        _userSequence.add(4);
                        changeCouleur(OpacityColor.blue);
                        // Simon.play(SimonColor.blue);
                        if (_colorMemorySequence.length ==
                            _userSequence.length) {
                          setState(() {
                            _result = checkSeqeunce();
                            if (_result)
                              sequenceSuivant();
                            else
                              gameOver();
                          });
                        }
                      },
                    ).getDecoration(),
                  ),
                ],
              ),
              kHeightSpacer,
              _button,
              kHeightSpacer,
              // GestureDetector(
              //   child: Text(
              //     'Test',
              //     style: TextStyle(color: Colors.amber[900]),
              //   ),
              //   // onTap: launcUrl,
              // )
            ],
          ),
        ),
      ),
    );
  }

  Scaffold colorX(BuildContext context, int value) {
    AppBar(
      backgroundColor: Color.fromRGBO(64, 75, 96, .9),
      title: Text(TITLE_TEXT), //(je sais pas faire le constructeur)
    );
  }
}
