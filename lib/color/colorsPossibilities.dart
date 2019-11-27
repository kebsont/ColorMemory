import 'package:flutter/material.dart';
import 'package:colormemory/utils/constants.dart';
class ColorsPossibilities {
  int _color_number = 0;
  AppBar appBar = new AppBar();
  ColorsPossibilities(int color) {
    _color_number = color;
  }

  Scaffold colorX(BuildContext context, int value) {
    appBar = AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        title: Text(TITLE_TEXT),
      );
    switch (value) {
      case 5:
        {
          return color5(context);
        }
        break;

      case 6:
        {
          return color6(context);
        }
        break;
      case 7:
        {
          return color7(context);
        }
        break;
      case 8:
        {
          return color8(context);
        }
        break;

      case 9:
        {
          return color9(context);
        }
        break;
      case 10:
        {
          return color10(context);
        }
        break;
      
      default:
        {
          //4 by default
          return color4(context);
        }
        break;
    }
  }

  Scaffold color4(BuildContext context) {
<<<<<<< Updated upstream
        AppBar appBar = AppBar(
      title: Text("widget.title"), //(je sais pas faire le constructeur)
    );
    double h_widget =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;
    double w_widget = MediaQuery.of(context).size.width;
    double h_button = 0.29 * h_widget;
    double w_button = 0.15 * w_widget;
    double h_margin1 = 0.0725 * h_widget;
    double h_margin2 = 0.145 * h_widget;
    double w_margin1 = 0.15 * w_widget;
    double w_margin2 = 0.15 * w_widget;
=======
>>>>>>> Stashed changes
    return new Scaffold(
        appBar: appBar,
        body: Column(
          children: <Widget>[
            // Ligne de Niveau et du nbre de vie
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
<<<<<<< Updated upstream
                  child: Text(LEVEL_TEXT+"\$niveau"),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(LIFE_TEXT+"\$vie"),
=======
                  child: _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: _lifeWidget(context),
>>>>>>> Stashed changes
                )
              ],
            ),

            Row(
<<<<<<< Updated upstream
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
=======
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
>>>>>>> Stashed changes
            ),
            Row(
<<<<<<< Updated upstream
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
=======
              children: <Widget>[emptyArea(context), emptyArea(context), emptyArea(context)],
            ),
            Row(
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
            ),
            Row(
              children: <Widget>[emptyArea(context), emptyArea(context), emptyArea(context)],
>>>>>>> Stashed changes
            )
          ],
        ));
  }

  Scaffold color5(BuildContext context) {

    return new Scaffold(
        appBar: appBar,
        body: Column(
          children: <Widget>[
            // Ligne de Niveau et du nbre de vie
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
<<<<<<< Updated upstream
                  child: Text(LEVEL_TEXT+"\$niveau"), //(je sais pas faire le constructeur)
                ),
                Container(
                  alignment: Alignment.topRight,
                  child:
                      Text(LIFE_TEXT+"\$vie"), //(je sais pas faire le constructeur)
=======
                  child: _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: _lifeWidget(context),
>>>>>>> Stashed changes
                )
              ],
            ),

            Row(
<<<<<<< Updated upstream
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
                    key: Key('5'),
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
                    key: Key('2'),
                  ),
                )
              ],
=======
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
>>>>>>> Stashed changes
            ),
            Row(
<<<<<<< Updated upstream
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
                  // decoration: new BoxDecoration(
                  //     color: Colors.teal, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('6'), //Vide car le 6 n'est pas mis en place
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
=======
              children: <Widget>[emptyArea(context), BoutonColor(), emptyArea(context)],
            ),
            Row(
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
            ),
            Row(
              children: <Widget>[emptyArea(context), emptyArea(context), emptyArea(context)],
>>>>>>> Stashed changes
            )
          ],
        ));
  }

  Scaffold color6(BuildContext context) {
<<<<<<< Updated upstream
     AppBar appBar = AppBar(
      title: Text("widget.title"), //(je sais pas faire le constructeur)
    );
    double h_widget =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;
    double w_widget = MediaQuery.of(context).size.width;
    double h_button = 0.29 * h_widget;
    double w_button = 0.15 * w_widget;
    double h_margin1 = 0.0725 * h_widget;
    double h_margin2 = 0.145 * h_widget;
    double w_margin1 = 0.15 * w_widget;
    double w_margin2 = 0.15 * w_widget;
=======
>>>>>>> Stashed changes

    return new Scaffold(
        appBar: appBar,
        body: Column(
          children: <Widget>[
            // Ligne de Niveau et du nbre de vie
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
<<<<<<< Updated upstream
                  child: Text(LEVEL_TEXT+"\$niveau"), //(je sais pas faire le constructeur)
                ),
                Container(
                  alignment: Alignment.topRight,
                  child:
                      Text(LIFE_TEXT+"\$vie"), //(je sais pas faire le constructeur)
=======
                  child: _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: _lifeWidget(context),
>>>>>>> Stashed changes
                )
              ],
            ),
            Row(
<<<<<<< Updated upstream
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
                    key: Key('5'),
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
                    key: Key('2'),
                  ),
                )
              ],
=======
              children: <Widget>[emptyArea(context), BoutonColor(), emptyArea(context)],
>>>>>>> Stashed changes
            ),
            Row(
<<<<<<< Updated upstream
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
                      color: Colors.indigo, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('6'), //Vide car le 6 n'est pas mis en place
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
=======
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
            ),
            Row(
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
            ),
            Row(
              children: <Widget>[emptyArea(context), BoutonColor(), emptyArea(context)],
>>>>>>> Stashed changes
            )
          ],
        ));
  }

  Scaffold color7(BuildContext context) {
<<<<<<< Updated upstream
    AppBar appBar = AppBar(
      title: Text("widget.title"), //(je sais pas faire le constructeur)
    );
    double h_widget = MediaQuery.of(context).size.height - appBar.preferredSize.height;
    double w_widget = MediaQuery.of(context).size.width;
    double h_button = 0.29 * h_widget;
    double w_button = 0.15 * w_widget;
    double h_margin1 = 0.0725 * h_widget ;
    double h_margin2 = 0.145 * h_widget ;
    double w_margin1 = 0.0355 * w_widget;
    double w_margin2 = 0.0355 * w_widget;

    return new Scaffold(
        appBar: new AppBar(
        title: new Text("Color Memory"),
      ),
      body: Column(
=======

    return new Scaffold(
        appBar: appBar,
        body: Column(
>>>>>>> Stashed changes
          children: <Widget>[
            // Ligne de Niveau et du nbre de vie
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
<<<<<<< Updated upstream
                  child: Text(LEVEL_TEXT+"\$niveau"), //(je sais pas faire le constructeur)
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(LIFE_TEXT+"\$vie"), //(je sais pas faire le constructeur)
=======
                  child: _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: _lifeWidget(context),
>>>>>>> Stashed changes
                )
              ],
            ),


            Row(
<<<<<<< Updated upstream
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
=======
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
>>>>>>> Stashed changes
            ),
            Row(
<<<<<<< Updated upstream
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
=======
              children: <Widget>[BoutonColor(), BoutonColor(),BoutonColor()],
            ),
            Row(
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
            ),
            Row(
              children: <Widget>[emptyArea(context), emptyArea(context), emptyArea(context)],
>>>>>>> Stashed changes
            )
          ],
        ));
  }

  Scaffold color8(BuildContext context) {
<<<<<<< Updated upstream
      AppBar appBar = AppBar(
      title: Text("widget.title"), //(je sais pas faire le constructeur)
    );
    double h_widget = MediaQuery.of(context).size.height - appBar.preferredSize.height;
    double w_widget = MediaQuery.of(context).size.width;
    double h_button = 0.29 * h_widget;
    double w_button = 0.15 * w_widget;
    double h_margin1 = 0.0725 * h_widget ;
    double h_margin2 = 0.145 * h_widget ;
    double w_margin1 = 0.0725 * w_widget;
    double w_margin2 = 0.0725 * w_widget;

    return new Scaffold(
        appBar: new AppBar(
        title: new Text("Color Memory"),
      ),
      body: Column(
=======
    return new Scaffold(
        appBar: appBar,
        body: Column(
>>>>>>> Stashed changes
          children: <Widget>[
            // Ligne de Niveau et du nbre de vie
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
<<<<<<< Updated upstream
                  child: Text(LEVEL_TEXT+"\$niveau"), //(je sais pas faire le constructeur)
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(LIFE_TEXT+"\$vie"), //(je sais pas faire le constructeur)
=======
                  child: _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: _lifeWidget(context),
>>>>>>> Stashed changes
                )
              ],
            ),
            Row(
<<<<<<< Updated upstream
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
                    key: Key('5'),
                  ),
                ),
                new GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.purple, shape: BoxShape.circle),
                    margin: EdgeInsets.only(
                        top: h_margin1, left: w_margin1, right: 0.0, bottom: 0),
                    width: w_button,
                    height: h_button,
                    key: Key('5'),
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
                    key: Key('2'),
                  ),
                )
              ],
=======
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
>>>>>>> Stashed changes
            ),
            Row(
<<<<<<< Updated upstream
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
                      color: Colors.indigo, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('6'), 
                ),
                                Container(
                  decoration: new BoxDecoration(
                      color: Colors.orange, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('8'),
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
=======
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
            ),
            Row(
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
            ),
            Row(
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
>>>>>>> Stashed changes
            )
          ],
        ));
  }

  Scaffold color9(BuildContext context) {
<<<<<<< Updated upstream
     AppBar appBar = AppBar(
      title: Text("widget.title"), //(je sais pas faire le constructeur)
    );
    double h_widget = MediaQuery.of(context).size.height - appBar.preferredSize.height;
    double w_widget = MediaQuery.of(context).size.width;
    double h_button = 0.29 * h_widget;
    double w_button = 0.15 * w_widget;
    double h_margin1 = 0.0725 * h_widget ;
    double h_margin2 = 0.145 * h_widget ;
    double w_margin1 = 0.0355 * w_widget;
    double w_margin2 = 0.0355 * w_widget;

    return new Scaffold(
        appBar: new AppBar(
        title: new Text("Color Memory"),
      ),
      body: Column(
=======

    return new Scaffold(
        appBar: appBar,
        body: Column(
>>>>>>> Stashed changes
          children: <Widget>[
            // Ligne de Niveau et du nbre de vie
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
<<<<<<< Updated upstream
                  child: Text(LEVEL_TEXT+"\$niveau"), //(je sais pas faire le constructeur)
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(LIFE_TEXT+"\$vie"), //(je sais pas faire le constructeur)
=======
                  child: _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: _lifeWidget(context),
>>>>>>> Stashed changes
                )
              ],
            ),

            Row(
<<<<<<< Updated upstream
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
                        color: Colors.black, shape: BoxShape.circle),
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
                        color: Colors.purple, shape: BoxShape.circle),
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
=======
              children: <Widget>[BoutonColor(), BoutonColor(), BoutonColor()],
>>>>>>> Stashed changes
            ),
            Row(
<<<<<<< Updated upstream
              children: <Widget>[
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
                  decoration: new BoxDecoration(
                      color: Colors.indigo, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('7'), 
                ),
                Container(
                  // decoration: new BoxDecoration(
                  //     color: Colors.orange, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('X1'),
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.orange, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('8'),
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.yellow, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin2, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('9'),
                ),
              ],
=======
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
            ),
            Row(
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
            ),
            Row(
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
>>>>>>> Stashed changes
            )
          ],
        ));
  }

  Scaffold color10(BuildContext context) {
<<<<<<< Updated upstream
    AppBar appBar = AppBar(
      title: Text("widget.title"), //(je sais pas faire le constructeur)
    );
    double h_widget = MediaQuery.of(context).size.height - appBar.preferredSize.height;
    double w_widget = MediaQuery.of(context).size.width;
    double h_button = 0.29 * h_widget;
    double w_button = 0.15 * w_widget;
    double h_margin1 = 0.0725 * h_widget ;
    double h_margin2 = 0.145 * h_widget ;
    double w_margin1 = 0.0355 * w_widget;
    double w_margin2 = 0.0355 * w_widget;

    return new Scaffold(
        appBar: new AppBar(
        title: new Text("Color Memory"),
      ),
      body: Column(
=======
    return new Scaffold(
        appBar: appBar,
        body: Column(
>>>>>>> Stashed changes
          children: <Widget>[
            // Ligne de Niveau et du nbre de vie
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
<<<<<<< Updated upstream
                  child: Text(LEVEL_TEXT+"\$niveau"), //(je sais pas faire le constructeur)
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(LIFE_TEXT+"\$vie"), //(je sais pas faire le constructeur)
=======
                  child: _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: _lifeWidget(context),
>>>>>>> Stashed changes
                )
              ],
            ),

            Row(
<<<<<<< Updated upstream
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
                        color: Colors.black, shape: BoxShape.circle),
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
                        color: Colors.purple, shape: BoxShape.circle),
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
=======
              children: <Widget>[BoutonColor(), BoutonColor(), BoutonColor()],
>>>>>>> Stashed changes
            ),
            Row(
<<<<<<< Updated upstream
              children: <Widget>[
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
                  decoration: new BoxDecoration(
                      color: Colors.indigo, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('7'), 
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.grey, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('8'), 
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.orange, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('9'),
                ),
                Container(
                  decoration: new BoxDecoration(
                      color: Colors.yellow, shape: BoxShape.circle),
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin2, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('10'),
                ),
              ],
=======
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
            ),
            Row(
              children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],
            ),
            Row(
              children: <Widget>[BoutonColor(),BoutonColor(), BoutonColor()],
>>>>>>> Stashed changes
            )
          ],
        ));
  }
<<<<<<< Updated upstream
=======

String getLife_Text (){
  String life_text = "";
  for (var i = 0; i < MyHomePage().vie; i++) {
    life_text += "♥︎";
  }
  return life_text;

}

  Widget _lifeWidget(BuildContext context) {
      return RichText(
        text: TextSpan(
          // set the default style for the children TextSpans
          style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18),
          children: [
            TextSpan(
              text: getLife_Text(),
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold
              )
            )
          ]
        )
      );
    }
  Widget _levelWidget(BuildContext context) {
      return RichText(
        text: TextSpan(
          // set the default style for the children TextSpans
          style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18),
          children: [
            TextSpan(
                text: LEVEL_TEXT,
            ),
            TextSpan(
              text: MyHomePage().niveau.toString(),
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold
              )
            )
          ]
        )
      );
    }
  Container emptyArea(BuildContext context){
    double h_widget =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;
    double w_widget = MediaQuery.of(context).size.width;
    double h_button = 0.15 * h_widget;
    double w_button = 0.20 * w_widget;
    // double h_margin1 = 0.0075 * h_widget;
    double h_margin2 = 0.07 * h_widget;
    double w_margin1 = 0.10 * w_widget;
    // double w_margin2 = 0.0375 * w_widget;
    return Container( //invisible
      margin: EdgeInsets.only(
        top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
      width: w_button,
      height: h_button,
      // key: Key('X'),
    );
  }
>>>>>>> Stashed changes
}
