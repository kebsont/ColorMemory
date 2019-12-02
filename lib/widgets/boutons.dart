import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:colormemory/utils/constants.dart';



  


class BoutonColor {
  static double h_widget = 716;
        // MediaQuery.of(context).size.height - appBar.preferredSize.height;
   static double w_widget = 360.0;
    //  MediaQuery.of(context).size.width;
    double h_button = 0.10 * h_widget;
    double w_button = 0.20 * w_widget;
  BoutonColor({@required this.color, @required this.onPressed});
  final Color color;
  final Function onPressed;

  final _radius = BorderRadius.all(Radius.circular(30.0));

  Container getDecoration() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: _radius,
        color: color,
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: _radius),
        child: null,
        onPressed: onPressed,
      ),
      width: w_button,
      height: h_button,
    );
  }
}
