import 'package:flutter/material.dart';

class StartStopButtonClass {
  StartStopButtonClass({@required this.label, @required this.onTap});
  final String label;
  final Function onTap;

  Widget startStopButton() {
    return Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.white)
        ),
        textColor: Colors.white,
        color: Colors.grey,
        // splashColor: Colors.black54,
        child: Text(label),
        onPressed: onTap,
        elevation: 2.0,
      ),
      width: 150.0,
      height: 50.0,
    );
  }
}
