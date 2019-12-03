import 'package:colormemory/models/settings.dart';
import 'package:colormemory/models/state.dart';
import 'package:colormemory/services/authentication.dart';
import 'package:colormemory/utils/state_wdg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:colormemory/main.dart';
import 'package:colormemory/utils/constants.dart' as Constants;
import 'package:colormemory/models/user.dart';

class HomeWithMenu extends StatefulWidget {
  final StateModel state;

  const HomeWithMenu({Key key, this.state}) : super(key: key);

  State<StatefulWidget> createState() => _HomeWithMenuState();
}

class _HomeWithMenuState extends State<HomeWithMenu> {
  var mode = {
    "Débutant": Constants.MODE_FACILE,
    "Avancé": Constants.MODE_DIFFICILE,
    "Expert": Constants.MODE_EXPERT,
    "Chrono": Constants.MODE_CHRONO
  };
  var mode_id = {
    "Débutant": 1,
    "Avancé": 2,
    "Expert": 3,
    "Chrono": 4
  };
  StateModel appState;
  Settings testSettings;
  Settings settingss;
  String user_pseudo;
  // User user = Auth.getUserLocally();

  @override
  void initState() {
    super.initState();
    getLocalUserPseudo();

    setState(() {
      // myConnectedUser
    });
  }

  //  Future <Settings> getSeetings() async {
  //    Settings settings = await Auth.getSettingsLocal();
  //    setState(() {
  //     state.settings = settings;
  //     testSettings = settings;
  //   });
  //         return await Auth.getSettingsLocal();
  //  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Changer l'orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: Constants.TITLE_TEXT,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(64, 75, 96, .9),
            title: Text(Constants.TITLE_TEXT),
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.power_settings_new),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
              )
            ],
          ),
          body: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(5)),
              SizedBox(
                height: 28.0,
                child: Container(
                  color: Colors.white,
                ),
              ),
              Center(
                child: _welcomeWidget(context),
                // child: 
                // Text(
                //   "Bienvenue $user_pseudo,\nSelectionne un niveau :",
                  // style: TextStyle(fontSize: 18),
                // ),
              ),
              SizedBox(
                height: 28.0,
                child: Container(
                  color: Colors.white,
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: mode.length,
                itemBuilder: (BuildContext context, int index) {
                  // return makeCard;
                  String key = mode.keys.elementAt(index);
                  return new Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                      child: ListTile(
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
                                        title: Constants.TITLE_TEXT,
                                        home_phase : mode_id[key]
                                      )));
                        },
                      ));
                },
              ),
              SizedBox(height: 28.0),
            ],
          )),
    );
  }

  getLocalUserPseudo() async {
    user_pseudo = await Auth.getPseudo();
    setState(() {
      user_pseudo = user_pseudo;
    });
    return user_pseudo;
  }

  Widget _welcomeWidget(BuildContext context) {
    return RichText(
      text: TextSpan(
        // set the default style for the children TextSpans
        style: Theme.of(context).textTheme.body1.copyWith(fontSize: 18),
        children: [
          TextSpan(
              text: 'Bienvenue ',
          ),
          TextSpan(
            text: '$user_pseudo',
            style: TextStyle(
              color: Colors.grey
            )
          ),
          TextSpan(
              text: '\nSelectionne un niveau :',
          ),
        ]
      )
    );
  }
}
