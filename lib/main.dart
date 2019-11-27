import 'dart:async';

import 'package:colormemory/login_signup_page.dart';
import 'package:colormemory/services/authentication.dart';
import 'package:colormemory/widgets/registration.dart';
import 'package:colormemory/widgets/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:colormemory/widgets/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  BaseAuth auth;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Memory',
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

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorTween;

  int niveau = 1;
  int vie = 9;
  int _counter = 0;
  double h_button = 0;
  double w_button = 0;
  double h_margin1 = 0;
  double h_margin2 = 0;
  double w_margin1 = 0;
  double w_margin2 = 0;
  double h_widget = 0;
  double w_widget = 0;

  bool _visible = true;
  Timer _timer;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _colorTween = ColorTween(begin: Colors.red[900], end: Colors.green)
        .animate(_animationController);

    super.initState();
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    print("Tab1");
    print("Tab2");
    AnimateButton();

    super.didUpdateWidget(oldWidget);
    AnimateButton();
  }

  @override
  void dispose() {
    super.dispose();
    // _animationController.dispose();
  }

  AnimateButton() {
    print("Animation appelee");
    _timer = new Timer(const Duration(milliseconds: 900), () {
      _animationController.reset();
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    _timer = new Timer(const Duration(seconds: 5), () {
      // _animationController.reset();
      // _animationController.forward();
    print("Tab3");
    });
    AppBar appBar = AppBar(
      title: Text(widget.title),
    );
    h_widget = MediaQuery.of(context).size.height - appBar.preferredSize.height;
    w_widget = MediaQuery.of(context).size.width;
    h_button = 0.29 * h_widget;
    w_button = 0.15 * w_widget;
    h_margin1 = 0.0725 * h_widget;
    h_margin2 = 0.145 * h_widget;
    w_margin1 = 0.15 * w_widget;
    w_margin2 = 0.15 * w_widget * 2.5;

    // TRACES
    List<Key> buttonsList;

    return Scaffold(
        appBar: appBar,
        body: Column(
          children: <Widget>[
            // Ligne de Niveau et du nbre de vie
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("Niveau: $niveau"),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text("Vie: $vie"),
                )
              ],
            ),

            Row(
              children: <Widget>[
                AnimatedBuilder(
                  animation: _colorTween,
                  builder: (context, child) => new GestureDetector(
                    onTap: () {
                      if (_animationController.status ==
                          AnimationStatus.completed) {
                        _animationController.reverse();
                      } else {
                        _animationController.forward();
                      }
                    },
                    child: Container(
                      decoration: new BoxDecoration(
                          color: _colorTween.value, shape: BoxShape.circle),
                      margin: EdgeInsets.only(
                          top: h_margin1,
                          left: w_margin1,
                          right: 0.0,
                          bottom: 0),
                      width: w_button,
                      height: h_button,
                      key: Key('1'),
                    ),
                  ),
                ),
                AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 200),
                    child: new GestureDetector(
                      onTap: () {
                        setState(() {
                          _visible = !_visible;
                        });
                        print("Bouton cliqué");
                      },
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Colors.greenAccent, shape: BoxShape.circle),
                        margin: EdgeInsets.only(
                            top: h_margin1,
                            left: w_margin2,
                            right: 0.0,
                            bottom: 0),
                        width: w_button,
                        height: h_button,
                        key: Key('2'),
                      ),
                    )),
              ],
            ),

            Row(
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.teal, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('3'),
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.yellow, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin2, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('4'),
                ),
              ],
            )
          ],
        ));

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
