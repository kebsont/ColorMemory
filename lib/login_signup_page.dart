import 'package:flutter/material.dart';
import 'package:colormemory/services/authentication.dart';
import 'package:colormemory/models/user.dart';
import 'package:colormemory/utils/validator.dart';
import 'package:flushbar/flushbar.dart';
import 'package:colormemory/utils/state_wdg.dart';

// import 'package:firebase_auth/firebase_auth.dart';
class LoginSignUpPage extends StatefulWidget {
  LoginSignUpPage({this.auth, this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginSignUpPageState();
}

enum FormMode { LOGIN, SIGNUP }

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  final _formKey = new GlobalKey<FormState>();

 static final TextEditingController _pseudo = new TextEditingController();
  static final TextEditingController _email = new TextEditingController();
 static  final TextEditingController _password = new TextEditingController();
  String _errorMessage;

// Initial form is login form
  FormMode _formMode = FormMode.LOGIN;
  Orientation orientation = Orientation.portrait;
  bool _isIos;
  bool _autoValidate = false;
  bool _isLoading = false;

// Check if form is valid before perform login or signup
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

// Perform login or signup
  void _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        if (_formMode == FormMode.LOGIN) {
          _emailLogin(
            email: _email.text,
            password: _password.text,
            context: context
          );
          // userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
           _emailSignUp(
             pseudo: _pseudo.text,
             email: _email.text,
             password: _password.text,
             context: context
           );
          // userId = await widget.auth.signUp(_email, _password);
         Auth.sendEmailVerification();
          _showVerifyEmailSentDialog();
          // print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId != null &&
            userId.length > 0 &&
            _formMode == FormMode.LOGIN) {
          widget.onSignedIn();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          if (_isIos) {
            _errorMessage = e.details;
          } else
            _errorMessage = e.message;
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  void _changeFormToSignUp() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _changeFormToLogin() {
    _formKey.currentState.reset();
    _errorMessage = "";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  @override
  Widget build(BuildContext context) {
    _isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return new Scaffold(
        // appBar: new AppBar(
        //   title: new Text("Jua"),
        // ),
        body: Stack(
      children: <Widget>[
        _showBody(),
        _showCircularProgress(),
      ],
    ));
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
              new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                _changeFormToLogin();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final gmailButton = Material(
    child: Image.asset("assets/search.png"),
  );

  final facebookButton = Material(
    child: Image.asset("assets/facebook.png"),
  );

  Widget getListSIGNUP() {
    return Column(
      children: <Widget>[
        firstName,
        SizedBox(height: 28.0),
        getListSIGNIN()
        // _showEmailInput(),
        // _showPasswordInput()
      ],
    );
  }

  Widget getListSIGNIN() {
    return Column(
      children: <Widget>[email, SizedBox(height: 28.0), password],
    );
  }

  Widget _showBody() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Center(
                    child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _showLogo(),
                      SizedBox(height: 48.0),
                      _formMode == FormMode.SIGNUP
                          ? getListSIGNUP()
                          : getListSIGNIN(),
                      _showPrimaryButton(),
                      SizedBox(
                        height: 15.0,
                      ),
                      Center(
                        child: Text("ou"),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 115,
                          ),
                          gmailButton,
                          SizedBox(width: 35.0),
                          facebookButton
                        ],
                      ),
                      SizedBox(
                        height: 55.0,
                      ),
                      _showSecondaryButton(),
                      _showErrorMessage(),
                    ],
                  ),
                )))));
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
            child: Image.network("https://cdn.pixabay.com/photo/2017/03/12/13/41/beaded-2137080_960_720.jpg"),
        ),
      ),
    );
  }
final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _email,
      validator: Validator.validateEmail,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.email,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: _password,
      validator: Validator.validatePassword,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.lock,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Mot de passe',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

final firstName = TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      controller: _pseudo,
      validator: Validator.validateName,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.person,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Prénom',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

  
  

  Widget _showPrimaryButton() {
    var _formMode;
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: new RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          color: Colors.blue,
          child: _formMode == FormMode.LOGIN
              ? new Text('Se connecter',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white))
              : new Text("S'inscrire",
                  style: new TextStyle(fontSize: 20.0, color: Colors.white)),
          onPressed: _validateAndSubmit,
        ));
  }

  Widget _showSecondaryButton() {
    return new FlatButton(
      child: _formMode == FormMode.LOGIN
          ? new Text('Pas encore de compte? S\'inscrire',
              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300))
          : new Text('Déjà inscrit? Se connecter',
              style:
                  new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
      onPressed: _formMode == FormMode.LOGIN
          ? _changeFormToSignUp
          : _changeFormToLogin,
    );
  }

  Future<void> _changeLoadingVisible() async {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

   void _emailSignUp(
      {String pseudo,
      String email,
      String password,
      BuildContext context}) async {
    if (_formKey.currentState.validate()) {
      try {
        // SystemChannels.textInput.invokeMethod('TextInput.hide');
        await _changeLoadingVisible();
        //need await so it has chance to go through error if found.
        await Auth.signUp(email, password).then((uID) {
          Auth.addUserSettingsDB(new User(
            userId: uID,
            email: email,
            pseudo: pseudo,
          ));
        });
        //now automatically login user too
        await StateWidget.of(context).logInUser(email, password);
        await Navigator.pushNamed(context, '/signin');
      } catch (e) {
        _changeLoadingVisible();
        print("Sign Up Error: $e");
        String exception = Auth.getExceptionText(e);
        Flushbar(
          title: "Erreur d'inscription",
          message: exception,
          duration: Duration(seconds: 5),
        )..show(context);
      
      }
    } else {
      setState(() => _autoValidate = true);
    }
  }

  void _emailLogin(
      {String email, String password, BuildContext context}) async {
    if (_formKey.currentState.validate()) {
      try {
        // SystemChannels.textInput.invokeMethod('TextInput.hide');
        await _changeLoadingVisible();
        //need await so it has chance to go through error if found.
        await StateWidget.of(context).logInUser(email, password);
        // await Navigator.pushNamed(context, '/');
      } catch (e) {
        _changeLoadingVisible();
        print("Sign In Error: $e");
        String exception = Auth.getExceptionText(e);
        Flushbar(
          title: "Erreur de connexion",
          message: exception,
          duration: Duration(seconds: 5),
        )..show(context);
      }
    } else {
      setState(() => _autoValidate = true);
    }
  }

  final forgotLabel = FlatButton(
      child: Text(
        'Mot de passe oublié',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        // Navigator.pushNamed(context, '/forgot-password');
      },
    );

}
