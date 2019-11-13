import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Changer l'orientation
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      title: 'Color Memory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Color Memory'),
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
  int niveau = 1;
  int vie = 2;
  int _counter = 0;
  double h_button = 0;
  double w_button = 0;
  double h_margin1 = 0;
  double h_margin2 = 0;
  double w_margin1 = 0;
  double w_margin2 = 0;
  double h_widget = 0;
  double w_widget = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(widget.title),
    );
    h_widget = MediaQuery.of(context).size.height - appBar.preferredSize.height;
    w_widget = MediaQuery.of(context).size.width;
    h_button = 0.29 * h_widget;
    w_button = 0.15 * w_widget;
    h_margin1 = 0.0725 * h_widget ;
    h_margin2 = 0.145 * h_widget ;
    w_margin1 = 0.15 * w_widget;
    w_margin2 = 0.15 * w_widget * 2.5;
    // print('${MediaQuery.of(context).size.height - appBar.preferredSize.height} ');
    // print('${MediaQuery.of(context).size.width} ');
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
                new GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    margin: EdgeInsets.only(
                        top: h_margin1, left: w_margin1, right: 0.0, bottom: 0),
                    width: w_button,
                    height: h_button,
                    key: Key('1'),
                  ),
                ),
                new GestureDetector(
                  onTap: () {
                    print("Bouton cliqué");
                  },
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    margin: EdgeInsets.only(
                        top: h_margin1, left: w_margin2, right: 0.0, bottom: 0),
                    width: w_button,
                    height: h_button,
                    key: Key('2'),
                  ),
                )
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
