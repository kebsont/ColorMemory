import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:colormemory/main.dart';

class Home extends StatelessWidget {
  var mode = {
    "Débutant": "Le plus facile",
    "Normal": "Le mode moyen",
    "Difficile": "Hardcore"
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Changer l'orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'Color Memory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(64, 75, 96, .9),
            title: Text("Color Memory"),
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.exit_to_app),
                onPressed: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
              
              )
            ],
          ),
          body: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(5)),
              Center(
                child: Text(
                  "Veuillez choisir un niveau",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  // return makeCard;
                  String key = mode.keys.elementAt(index);
                  return new Container(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                    child: new ListTile(
                      title: new Text(
                        "$key",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                        textDirection: TextDirection.ltr,
                      ),
                      subtitle: new Text("${mode[key]}",
                          style: TextStyle(color: Colors.white),
                          textDirection: TextDirection.ltr),
                      trailing: Icon(Icons.keyboard_arrow_right,
                          color: Colors.white, size: 30.0),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage(
                                      title: "Color Memory",
                                    )));
                      },
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }
}
