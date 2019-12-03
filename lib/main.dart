import 'dart:async';

import 'package:colormemory/login_signup_page.dart';
import 'package:colormemory/services/authentication.dart';
import 'package:colormemory/utils/memoryColor.dart';
import 'package:colormemory/widgets/boutons.dart';
import 'package:colormemory/widgets/registration.dart';
import 'package:colormemory/widgets/signin.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
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
  MyHomePage({Key key, this.title, this.home_phase}) : super(key: key);

  final String title;
  // int niveau = 0;
  int home_phase;
  int _counter = 0;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorTween;
  int phase = 0;
  int phase_max = 8; //facile
  int niveau = 0;
  int vie = 2; //facile
  bool lock_click = false;
  Widget _button;
  double _greenOpacity = 1.0;
  double _redOpacity = 1.0;
  double _yellowOpacity = 1.0;
  double _greyOpacity = 1.0;
  double _orangeOpacity = 1.0;
  double _pinkOpacity = 1.0;
  double _blackOpacity = 1.0;
  double _lightGreenOpacity = 1.0;
  double _purpleOpacity = 1.0;
  double _blueOpacity = 1.0;
  double _tealOpacity = 1.0;
  double _brownOpacity = 1.0;
  bool _result = false;
  String _gameLabel = '';
  List<int> _colorMemorySequence = [];
  List<int> _randTraduction = [];
  List<int> _userSequence = [];

  bool _visible = true;
  Timer _timer;
  int blocs = 4;
  @override
  void initState() {
    super.initState();
    // setVisibleBLocks(niveau);
    switch (blocs) {
      case 4:
      initStartStopButton(4);
        break;
      case 5:
      initStartStopButton(5);
        break;
      case 6:
      initStartStopButton(6);
        break;
      case 7:
      initStartStopButton(7);
        break;
      case 8:
      initStartStopButton(8);
        break;
      case 9:
      initStartStopButton(9);
        break;
      case 10:
      initStartStopButton(10);
        break;
      default:
      initStartStopButton(4);
    }
  }

  @override
  void dispose() {
    super.dispose();
    // _animationController.dispose();
  }

  

  void initStartStopButton(int nb_block) {
    if (vie > 0) {
      if (phase == 0) {
        _button = StartStopButtonClass(
            label: 'Commencer',
            onTap: () {
              setState(() {
                _result = true;
                _gameLabel = 'Partie en cours';
                if (niveau == 0) {niveau += 1;setVisibleBLocks(niveau);}
                phase = 1;
                _userSequence.clear();
                _colorMemorySequence.add(randomChoice(_randTraduction));
                playSequence(_colorMemorySequence);
                initStartStopButton(nb_block);
              });
            }).startStopButton();
      } else if (phase > 0) {
        _button = StartStopButtonClass(
            label: 'Arrêter',
            onTap: () {
              setState(() {
                stopSequence();
                _result = false;
                niveau = 0;
                phase = 0;
                _gameLabel = '';
                _colorMemorySequence.clear();
                _userSequence.clear();
                initStartStopButton(nb_block);
              });
            }).startStopButton();
      }
    } else {
      _button = StartStopButtonClass(
          label: 'Recommencer',
          onTap: () {
            setState(() {
              stopSequence();
              _result = false;
              niveau = 1;
              phase = 1;
              vie = 2;
              _gameLabel = '';
              _colorMemorySequence.clear();
              _userSequence.clear();
              _colorMemorySequence.add(randomChoice(_randTraduction));
              playSequence(_colorMemorySequence);
              initStartStopButton(niveau);
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
      case OpacityColor.grey:
        setState(() {
          _greyOpacity = _greyOpacity == 1.0 ? 0.0 : 1.0;
        });

        Future.delayed(kDelayedOpacityDuration, () {
          setState(() {
            _greyOpacity = _greyOpacity == 0.0 ? 1.0 : 0.0;
          });
        });
        break;
      case OpacityColor.orange:
        setState(() {
          _orangeOpacity = _orangeOpacity == 1.0 ? 0.0 : 1.0;
        });

        Future.delayed(kDelayedOpacityDuration, () {
          setState(() {
            _orangeOpacity = _orangeOpacity == 0.0 ? 1.0 : 0.0;
          });
        });
        break;
      case OpacityColor.pink:
        setState(() {
          _pinkOpacity = _pinkOpacity == 1.0 ? 0.0 : 1.0;
        });

        Future.delayed(kDelayedOpacityDuration, () {
          setState(() {
            _pinkOpacity = _pinkOpacity == 0.0 ? 1.0 : 0.0;
          });
        });
        break;
      case OpacityColor.black:
        setState(() {
          _blackOpacity = _blackOpacity == 1.0 ? 0.0 : 1.0;
        });

        Future.delayed(kDelayedOpacityDuration, () {
          setState(() {
            _blackOpacity = _blackOpacity == 0.0 ? 1.0 : 0.0;
          });
        });
        break;
      case OpacityColor.lightGreen:
        setState(() {
          _lightGreenOpacity = _lightGreenOpacity == 1.0 ? 0.0 : 1.0;
        });

        Future.delayed(kDelayedOpacityDuration, () {
          setState(() {
            _lightGreenOpacity = _lightGreenOpacity == 0.0 ? 1.0 : 0.0;
          });
        });
        break;
      case OpacityColor.purple:
        setState(() {
          _purpleOpacity = _purpleOpacity == 1.0 ? 0.0 : 1.0;
        });

        Future.delayed(kDelayedOpacityDuration, () {
          setState(() {
            _purpleOpacity = _purpleOpacity == 0.0 ? 1.0 : 0.0;
          });
        });
        break;
      case OpacityColor.teal:
        setState(() {
          _tealOpacity = _tealOpacity == 1.0 ? 0.0 : 1.0;
        });

        Future.delayed(kDelayedOpacityDuration, () {
          setState(() {
            _tealOpacity = _tealOpacity == 0.0 ? 1.0 : 0.0;
          });
        });
        break;
      case OpacityColor.brown:
        setState(() {
          _brownOpacity = _brownOpacity == 1.0 ? 0.0 : 1.0;
        });

        Future.delayed(kDelayedOpacityDuration, () {
          setState(() {
            _brownOpacity = _brownOpacity == 0.0 ? 1.0 : 0.0;
          });
        });
        break;
    }
  }

  void colormemoryPlay(int index, OpacityColor opacityColor) {
    Future.delayed(Duration(milliseconds: index * 700), () {
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
        colormemoryPlay(i, OpacityColor.grey);
          break;
        case 4:
        colormemoryPlay(i, OpacityColor.yellow);
          break;
        case 5:
          colormemoryPlay(i, OpacityColor.blue);
          break;
        case 6:
          colormemoryPlay(i, OpacityColor.orange);
          break;
        case 7:
          colormemoryPlay(i, OpacityColor.pink);
          break;
        case 8:
        colormemoryPlay(i, OpacityColor.brown);
          break;
        case 9:
          colormemoryPlay(i, OpacityColor.purple);
          break;
        case 10:
        colormemoryPlay(i, OpacityColor.black);
          
          break;
        case 11:
          colormemoryPlay(i, OpacityColor.teal);
          break;
        case 12:
        colormemoryPlay(i, OpacityColor.lightGreen);
          break;
      }
    }
    Future.delayed(Duration(milliseconds: colorMemorySequence.length * 700),
        () {
      lock_click = false;
      setState(() {
        _gameLabel = "A vous de jouer !";
      });
    });
  }

  void stopSequence() {}
  void sequenceSuivant() {
    setState(() {
      _gameLabel = "Bien joué !";
      lock_click = true;
      _userSequence.clear();
      _result = true;

      if (phase >= phase_max) {
        if (niveau < 7) {
          niveau++;
          phase = 1;
          // ajouter un nouveau bouton
          setVisibleBLocks(niveau);
          _colorMemorySequence.clear();
        } else {
          _gameLabel = 'Félicitation, vous avez gagné';
        }
      } else {
        phase++;
      }    
      _colorMemorySequence.add(randomChoice(_randTraduction));
    });

    Future.delayed(Duration(milliseconds: 1500), () {
      playSequence(_colorMemorySequence);
    });
  }

  void startSequence(List<int> sequence) {}

  bool checkSequence() {
    // J'ai modifié la vérification, c'est plus simple maintenant et ça vérifie sur la selection actuelle, (on a plus a attendre la fin)
    for (var i = 0; i < _userSequence.length; i++) {
      if ((_colorMemorySequence.length < i) ||
          (_colorMemorySequence[i] != _userSequence[i])) return false;
    }
    return true;
  }

  void gameOver() {
    setState(() {
      _result = false;
      vie--;
      phase = 0;

      _colorMemorySequence.clear();
      _userSequence.clear();
      if (vie <= 0) {
        niveau = 0;
        _gameLabel = 'Vous avez perdu la partie';
      } else
        _gameLabel = 'Vous avez perdu une vie';
      initStartStopButton(4);
    });
    _lifeWidget(vie, context);
  }

  Widget _lifeWidget(int vie, BuildContext context) {
    String life_text = "";
    for (var i = 0; i < vie; i++) {
      life_text += "♥︎";
    }

    return RichText(
        text: TextSpan(
            style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18),
            children: [
          TextSpan(
              text: life_text,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))
        ]));
  }

  Widget _levelWidget(int value, int value2, BuildContext context) {
    return RichText(
        text: TextSpan(
            style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18),
            children: [
          TextSpan(
            text: LEVEL_TEXT,
          ),
          TextSpan(
              text: value.toString() + "." + value2.toString(),
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(64, 75, 96, .9),
          title: Text(TITLE_TEXT),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: _levelWidget(niveau, phase, context),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: RichText(
                        text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(fontSize: 12),
                            children: [
                          TextSpan(
                              text: _gameLabel,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold))
                        ])),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: _lifeWidget(vie, context),
                  )
                ],
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
                        verificationSequence(1);
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
                        verificationSequence(2);
                      },
                    ).getDecoration(),
                  ),
                  kWidthSpacer,
                  AnimatedOpacity(
                    duration: kAnimatedOpacityDuration,
                    opacity: _greyOpacity,
                    child: BoutonColor(
                      color: Colors.grey,
                      onPressed: () {
                        verificationSequence(3);
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
                        verificationSequence(4);
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
                        verificationSequence(5);
                      },
                    ).getDecoration(),
                  ),
                  kWidthSpacer,
                  AnimatedOpacity(
                    duration: kAnimatedOpacityDuration,
                    opacity: _orangeOpacity,
                    child: BoutonColor(
                      color: Colors.orange,
                      onPressed: () {
                        verificationSequence(6);
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
                    opacity: _pinkOpacity,
                    child: BoutonColor(
                      color: Colors.pink,
                      onPressed: () {
                        verificationSequence(7);
                      },
                    ).getDecoration(),
                  ),
                  kWidthSpacer,
                  AnimatedOpacity(
                    duration: kAnimatedOpacityDuration,
                    opacity: _brownOpacity,
                    child: BoutonColor(
                      color: Colors.brown,
                      onPressed: () {
                        verificationSequence(8);
                      },
                    ).getDecoration(),
                  ),
                  kWidthSpacer,
                  AnimatedOpacity(
                    duration: kAnimatedOpacityDuration,
                    opacity: _purpleOpacity,
                    child: BoutonColor(
                      color: Colors.purple,
                      onPressed: () {
                        verificationSequence(9);
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
                    opacity: _blackOpacity,
                    child: BoutonColor(
                      color: Colors.black,
                      onPressed: () {
                        verificationSequence(10);
                      },
                    ).getDecoration(),
                  ),
                  kWidthSpacer,
                  AnimatedOpacity(
                    duration: kAnimatedOpacityDuration,
                    opacity: _tealOpacity,
                    child: BoutonColor(
                      color: Colors.teal,
                      onPressed: () {
                        verificationSequence(11);
                      },
                    ).getDecoration(),
                  ),
                  kWidthSpacer,
                  AnimatedOpacity(
                    duration: kAnimatedOpacityDuration,
                    opacity: _lightGreenOpacity,
                    child: BoutonColor(
                      color: Colors.lightGreen[500],
                      onPressed: () {
                        verificationSequence(12);
                      },
                    ).getDecoration(),
                  ),
                ],
              ),
              kHeightSpacer,
              new Expanded(
                  child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[_button],
                      ))),
              kHeightSpacer,
            ],
          ),
        ),
      ),
    );
  }

  bool verificationSequence(int seq_num) {
    // vérification générique sur le Onclick d'une couleur
    if (_colorMemorySequence.length > 0 && (!lock_click)) {
      _userSequence.add(seq_num);
      setState(() {
        _result = checkSequence();
        if (_result) {
          if (_colorMemorySequence.length == _userSequence.length)
            sequenceSuivant();
        } else
          gameOver();
      });
    }
  }

  void setVisibleBLocks(int niveau){
    Future.delayed(Duration(milliseconds: 200), () {
      
    
    _randTraduction.clear();
    _greenOpacity = 0.0;
    _redOpacity =0.0;
    _yellowOpacity = 0.0;
    _greyOpacity = 0.0;
    _orangeOpacity = 0.0;
    _pinkOpacity = 0.0;
    _blackOpacity = 0.0;
    _lightGreenOpacity = 0.0;
    _purpleOpacity = 0.0;
    _blueOpacity = 0.0;
    _tealOpacity = 0.0;
    _brownOpacity = 0.0;
    switch (niveau) {
      case 1: // 4 blocks
        _randTraduction.add(1);
        _randTraduction.add(3);
        _randTraduction.add(7);
        _randTraduction.add(9);
        _greenOpacity = 1.0;
        _greyOpacity = 1.0;
        _pinkOpacity = 1.0;
        _purpleOpacity = 1.0;
        break;
      case 2: // 5 blocks
        _randTraduction.add(1);
        _randTraduction.add(3);
        _randTraduction.add(5);
        _randTraduction.add(7);
        _randTraduction.add(9);
        _greenOpacity = 1.0;
        _greyOpacity = 1.0;
        _blueOpacity = 1.0;
        _pinkOpacity = 1.0;
        _purpleOpacity = 1.0;
        break;
      case 3: // 6 blocks
        _randTraduction.add(2);
        _randTraduction.add(4);
        _randTraduction.add(6);
        _randTraduction.add(7);
        _randTraduction.add(9);
        _randTraduction.add(11);
        _redOpacity =1.0;
        _yellowOpacity = 1.0;
        _pinkOpacity = 1.0;
        _tealOpacity = 1.0;
        _purpleOpacity = 1.0;
        _orangeOpacity = 1.0;
        break;
      case 4: // 7 blocks
        _randTraduction.add(2);
        _randTraduction.add(4);
        _randTraduction.add(6);
        _randTraduction.add(7);
        _randTraduction.add(9);
        _randTraduction.add(10);
        _randTraduction.add(12);
        _redOpacity =1.0;
        _yellowOpacity = 1.0;
        _pinkOpacity = 1.0;
        _blackOpacity = 1.0;
        _purpleOpacity = 1.0;
        _orangeOpacity = 1.0;
        _lightGreenOpacity = 1.0;
        break;
      case 5: // 8 blocks
        _randTraduction.add(1);
        _randTraduction.add(3);
        _randTraduction.add(4);
        _randTraduction.add(6);
        _randTraduction.add(7);
        _randTraduction.add(9);
        _randTraduction.add(10);
        _randTraduction.add(12);
        _greenOpacity = 1.0;
        _greyOpacity = 1.0;
        _yellowOpacity = 1.0;
        _pinkOpacity = 1.0;
        _blackOpacity = 1.0;
        _purpleOpacity = 1.0;
        _orangeOpacity = 1.0;
        _lightGreenOpacity = 1.0;
        break;
      case 6: // 9 blocks
        _randTraduction.add(1);
        _randTraduction.add(2);
        _randTraduction.add(3);
        _randTraduction.add(4);
        _randTraduction.add(6);
        _randTraduction.add(7);
        _randTraduction.add(9);
        _randTraduction.add(10);
        _randTraduction.add(12);
        _redOpacity =1.0;
        _greenOpacity = 1.0;
        _greyOpacity = 1.0;
        _yellowOpacity = 1.0;
        _pinkOpacity = 1.0;
        _blackOpacity = 1.0;
        _purpleOpacity = 1.0;
        _orangeOpacity = 1.0;
        _lightGreenOpacity = 1.0;
        break;
      case 7: // 10 blocks
        _randTraduction.add(1);
        _randTraduction.add(2);
        _randTraduction.add(3);
        _randTraduction.add(4);
        _randTraduction.add(6);
        _randTraduction.add(7);
        _randTraduction.add(9);
        _randTraduction.add(10);
        _randTraduction.add(11);
        _randTraduction.add(12);
        _redOpacity =1.0;
        _greenOpacity = 1.0;
        _greyOpacity = 1.0;
        _yellowOpacity = 1.0;
        _pinkOpacity = 1.0;
        _blackOpacity = 1.0;
        _purpleOpacity = 1.0;
        _orangeOpacity = 1.0;
        _lightGreenOpacity = 1.0;
        _tealOpacity = 1.0;
        break;
    }
    });
  }


  // Scaffold colorX(BuildContext context, int value) {
  //   AppBar(
  //     backgroundColor: Color.fromRGBO(64, 75, 96, .9),
  //     title: Text(TITLE_TEXT),
  //   );
  // }
}
