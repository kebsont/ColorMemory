import 'package:colormemory/widgets/boutons.dart';
import 'package:flutter/material.dart';
import 'package:colormemory/utils/constants.dart';
import 'package:colormemory/main.dart';


class ColorsPossibilities {
  int _color_number = 0;
  ColorsPossibilities(int color) {
    _color_number = color;
  }

  Scaffold colorX(BuildContext context, int value) {
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
                  child: Text(getLevel_Text()),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(getLife_Text()),
                )
              ],
            ),

            Row(
              children: <Widget>[
                BoutonColor(key: UniqueKey()),
                BoutonColor(
                  key: UniqueKey(),
                )
              ],
            ),

            Row(
              children: <Widget>[
                BoutonColor(key: UniqueKey()),
                BoutonColor(key: UniqueKey())
              ],
            )
          ],
        ));
  }

  Scaffold color5(BuildContext context) {
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
                  child: Text(getLevel_Text()),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(getLife_Text()),
                )
              ],
            ),

            Row(
              children: <Widget>[BoutonColor(), BoutonColor(), BoutonColor()],
            ),

            Row(
              children: <Widget>[
                BoutonColor(),
                Container(
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                ),
                BoutonColor()
              ],
            )
          ],
        ));
  }

  Scaffold color6(BuildContext context) {
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
                  child: Text(getLevel_Text()),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(getLife_Text()),
                )
              ],
            ),

            Row(
              children: <Widget>[BoutonColor(), BoutonColor(), BoutonColor()],
            ),

            Row(
              children: <Widget>[BoutonColor(), BoutonColor(), BoutonColor()],
            )
          ],
        ));
  }

  Scaffold color7(BuildContext context) {
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
    double w_margin1 = 0.0355 * w_widget;
    double w_margin2 = 0.0355 * w_widget;

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
                  child: Text(getLevel_Text()),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(getLife_Text()),
                )
              ],
            ),

            Row(
              children: <Widget>[
                BoutonColor(),
                BoutonColor(),
                BoutonColor(),
                BoutonColor(),
                BoutonColor()
              ],
            ),

            Row(
              children: <Widget>[
                Container(
                  //Invisible
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin2, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                ),
                BoutonColor(),
                Container(
                  //Invisible2
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin2, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                ),
                BoutonColor(),
                Container(
                  //Invisible3
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin2, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                )
              ],
            )
          ],
        ));
  }

  Scaffold color8(BuildContext context) {
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
    double w_margin1 = 0.0725 * w_widget;
    double w_margin2 = 0.0725 * w_widget;

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
                  child: Text(getLevel_Text()),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(getLife_Text()),
                )
              ],
            ),

            Row(
              children: <Widget>[
                BoutonColor(),
                BoutonColor(),
                BoutonColor(),
                BoutonColor()
              ],
            ),

            Row(
              children: <Widget>[
                BoutonColor(),
                BoutonColor(),
                BoutonColor(),
                BoutonColor()
              ],
            )
          ],
        ));
  }

  Scaffold color9(BuildContext context) {
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
    double w_margin1 = 0.0355 * w_widget;
    double w_margin2 = 0.0355 * w_widget;

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
                  child: Text(getLevel_Text()),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(getLife_Text()),
                )
              ],
            ),

            Row(
              children: <Widget>[
                BoutonColor(),
                BoutonColor(),
                BoutonColor(),
                BoutonColor(),
                BoutonColor()
              ],
            ),

            Row(
              children: <Widget>[
                BoutonColor(),
                BoutonColor(),
                Container( //invisible
                  margin: EdgeInsets.only(
                      top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
                  width: w_button,
                  height: h_button,
                  key: Key('X1'),
                ),
                BoutonColor(),
                BoutonColor()
              ],
            )
          ],
        ));
  }

  Scaffold color10(BuildContext context) {
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
    double w_margin1 = 0.0355 * w_widget;
    double w_margin2 = 0.0355 * w_widget;

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
                  child: Text(getLevel_Text()),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(getLife_Text()),
                )
              ],
            ),

            Row(
              children: <Widget>[
                BoutonColor(),
                BoutonColor(),
                BoutonColor(),
                BoutonColor(),
                BoutonColor()
              ],
            ),

            Row(
              children: <Widget>[
                BoutonColor(),
                BoutonColor(),
                BoutonColor(),
                BoutonColor(),
                BoutonColor()
              ],
            )
          ],
        ));
  }

  String getLevel_Text() {
    return LEVEL_TEXT +MyHomePage().niveau.toString();
  }

  String getLife_Text() {
    return LIFE_TEXT +MyHomePage().vie.toString();
  }
}
