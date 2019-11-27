import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_color/random_color.dart';

class BoutonColor extends StatefulWidget {
  BoutonColor({Key key}) : super(key: key); // our constructor

  @override
  BoutonColorState createState() => BoutonColorState();
}

class BoutonColorState extends State<BoutonColor> {
  
  RandomColor _randomColor = RandomColor();

  Color myColor;

  @override
  void initState() {
    super.initState();
    myColor = _randomColor.randomColor();
  }

    AppBar appBar = AppBar(
      title: Text("widget.title"), //(je sais pas faire le constructeur)
    );
  @override
  Widget build(BuildContext context) {
    double h_widget =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;
    double w_widget = MediaQuery.of(context).size.width;
    double h_button = 0.29 * h_widget;
    double w_button = 0.15 * w_widget;
    double h_margin1 = 0.0725 * h_widget;
    double h_margin2 = 0.145 * h_widget;
    double w_margin1 = 0.15 * w_widget;
    double w_margin2 = 0.15 * w_widget;
    return GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: new BoxDecoration(
                        color: myColor, shape: BoxShape.circle),
                    margin: EdgeInsets.only(
                        top: h_margin1, left: w_margin1, right: 0.0, bottom: 0),
                    width: w_button,
                    height: h_button,
                    key: Key('1'),
                  ),
                );
  }
}
