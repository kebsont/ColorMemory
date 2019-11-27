import 'dart:async';

import 'package:colormemory/login_signup_page.dart';
import 'package:colormemory/services/authentication.dart';
import 'package:colormemory/widgets/registration.dart';
import 'package:colormemory/widgets/signin.dart';
import 'package:flutter/material.dart';
import 'package:colormemory/color/colorsPossibilities.dart';
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
  int niveau = 1;
  int vie = 2;
  int _counter = 0;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorTween;

 

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

    ColorsPossibilities colorsPossibilities = new ColorsPossibilities(4);
    return colorsPossibilities.colorX(context,4);
  }

}
