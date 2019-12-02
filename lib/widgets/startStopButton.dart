import 'package:flutter/material.dart';

class StartStopButtonClass {
  StartStopButtonClass({@required this.label, @required this.onTap});
  final String label;
  final Function onTap;

  Widget startStopButton() {
    return Container(
      child: RaisedButton(
        splashColor: Colors.black54,
        child: Text(label),
        onPressed: onTap,
        elevation: 2.0,
      ),
      width: 150.0,
      height: 50.0,
    );
  }
}
