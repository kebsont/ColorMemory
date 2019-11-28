import 'package:colormemory/login_signup_page.dart';
import 'package:colormemory/services/authentication.dart';
import 'package:colormemory/widgets/registration.dart';
import 'package:colormemory/widgets/signin.dart';
import 'package:flutter/material.dart';
import 'package:colormemory/color/colorsPossibilities.dart';
import 'package:flutter/services.dart';
import 'package:colormemory/utils/constants.dart';
import 'package:colormemory/widgets/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  BaseAuth auth;
  @override
  Widget build(BuildContext context) {
   
    int niveau = 1;
    int vie = 9;
    int _counter = 0;


    return MaterialApp(
      title: TITLE_TEXT,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // home: MyHomePage(title: 'Color Memory'),
      // home: Home(),
      // home: SignUpScreen(this.auth),
      debugShowCheckedModeBanner: false,
        routes: {
        '/': (context) => SignInScreen(),
        '/registration': (context) => SignUpScreen(this.auth),
        '/home' : (context) => HomeWithMenu()
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

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    ColorsPossibilities colorsPossibilities = new ColorsPossibilities(4);
    return colorsPossibilities.colorX(context,5);
  }
}
