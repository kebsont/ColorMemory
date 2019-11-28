import 'package:colormemory/widgets/boutons.dart';
import 'package:flutter/material.dart';
import 'package:colormemory/utils/constants.dart';
import 'package:colormemory/main.dart';


class ColorsPossibilities {
  // int _color_number = 0;

  AppBar appBar = new AppBar();
  ColorsPossibilities() {
    // _color_number = color;
  }

  Scaffold colorX(BuildContext context, int value) {
     appBar = AppBar(
       backgroundColor: Color.fromRGBO(64, 75, 96, .9),
      title: Text(TITLE_TEXT), //(je sais pas faire le constructeur)
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
                  child:  _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child:  _lifeWidget(context),
                )
              ],
            ),

            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()]),
            Row(children: <Widget>[emptyArea(context), emptyArea(context), emptyArea(context)]),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()]),
            Row(children: <Widget>[emptyArea(context), emptyArea(context), emptyArea(context)])
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
                  child:  _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child:  _lifeWidget(context),
                )
              ],
            ),

            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],),
            Row(children: <Widget>[emptyArea(context), BoutonColor(), emptyArea(context)],),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],),
            Row(children: <Widget>[emptyArea(context), emptyArea(context), emptyArea(context)],)
          ],
        ));
  }

  Scaffold color6(BuildContext context) {
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
                  child:  _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child:  _lifeWidget(context),
                )
              ],
            ),

            Row(children: <Widget>[emptyArea(context), BoutonColor(), emptyArea(context)],),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],),
            Row(children: <Widget>[emptyArea(context), BoutonColor(), emptyArea(context)],),
          ],
        ));
  }

  Scaffold color7(BuildContext context) {
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
                  child:  _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child:  _lifeWidget(context),
                )
              ],
            ),
            Row(children: <Widget>[emptyArea(context), BoutonColor(), emptyArea(context)],),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],),          
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],)
          ],
        ));
  }

  Scaffold color8(BuildContext context) {
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
                  child:  _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child:  _lifeWidget(context),
                )
              ],
            ),

            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],)
          ],
        ));
  }

  Scaffold color9(BuildContext context) {

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
                  child:  _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child:  _lifeWidget(context),
                )
              ],
            ),

            Row(children: <Widget>[BoutonColor(), BoutonColor(), BoutonColor()],),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],)
          ],
        ));
  }

  Scaffold color10(BuildContext context) {
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
                  child:  _levelWidget(context),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child:  _lifeWidget(context),
                )
              ],
            ),

            Row(children: <Widget>[BoutonColor(), BoutonColor(), BoutonColor()],),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],),
            Row(children: <Widget>[BoutonColor(), emptyArea(context), BoutonColor()],),
            Row(children: <Widget>[BoutonColor(), BoutonColor(), BoutonColor()],)
          ],
        ));
  }

  // String getLevel_Text() {
  //   return LEVEL_TEXT +MyHomePage().niveau.toString();
  // }

  String getLife_Text(){
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
    double h_margin2 = 0.07 * h_widget;
    double w_margin1 = 0.10 * w_widget;
    return Container( //invisible
      margin: EdgeInsets.only(
        top: h_margin2, left: w_margin1, right: 0.0, bottom: 0),
      width: w_button,
      height: h_button,
      // key: Key('X'),
    );
  }
}
