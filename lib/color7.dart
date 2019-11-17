// import 'main.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class Color5 extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("widget.title"), //(je sais pas faire le constructeur)
    );
    double h_widget = MediaQuery.of(context).size.height - appBar.preferredSize.height;
    double w_widget = MediaQuery.of(context).size.width;
    double h_button = 0.29 * h_widget;
    double w_button = 0.15 * w_widget;
    double h_margin1 = 0.0725 * h_widget ;
    double h_margin2 = 0.145 * h_widget ;
    double w_margin1 = 0.15 * w_widget;
    double w_margin2 = 0.15 * w_widget;

    return new Scaffold(
        appBar: new AppBar(
        title: new Text("Color Memory"),
      ),
      body: Column(
          children: <Widget>[
            // Ligne de Niveau et du nbre de vie
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("Niveau: \$niveau"), //(je sais pas faire le constructeur)
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text("Vie: \$vie"), //(je sais pas faire le constructeur)
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
                  onTap: () {},
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.brown, shape: BoxShape.circle),
                    margin: EdgeInsets.only(
                        top: h_margin1, left: w_margin1, right: 0.0, bottom: 0),
                    width: w_button,
                    height: h_button,
                    key: Key('2'),
                  ),
                ),
                new GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.indigo, shape: BoxShape.circle),
                    margin: EdgeInsets.only(
                        top: h_margin1, left: w_margin1, right: 0.0, bottom: 0),
                    width: w_button,
                    height: h_button,
                    key: Key('3'),
                  ),
                ),
                new GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.orange, shape: BoxShape.circle),
                    margin: EdgeInsets.only(
                        top: h_margin1, left: w_margin1, right: 0.0, bottom: 0),
                    width: w_button,
                    height: h_button,
                    key: Key('4'),
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
                        top: h_margin1, left: w_margin1, right: 0.0, bottom: 0),
                    width: w_button,
                    height: h_button,
                    key: Key('5'),
                  ),
                )
              ],
            ),

            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin2, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('X1'), //Invisible1
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.teal, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('6'),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin2, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('X2'), //Invisible2
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.yellow, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin2, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('7'),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin2, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('X3'), //Invisible3
                )
              ],
            )
          ],
        ));
  }
}