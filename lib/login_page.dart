import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
//here it returns the _LoginPageState

}

class logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('images/one.jpg');
    Image image = Image(
      image: assetImage,
      width: 200.0,
      height: 200.0,
    );
    return Container(
      child: image,
    );
  }
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  //the underscore _ is used to make a class private
  String _email;
  String _password;
  FormType _formType = FormType.login;

  final formKey = new GlobalKey<FormState>();

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId =
              await widget.auth.signInWithEmailAndPassword(_email, _password);
//          FirebaseUser user = (await FirebaseAuth.instance
//              .signInWithEmailAndPassword(email: _email, password: _password))
//              .user;
          print('sign in user:$userId');
        } else {
          String userId = await widget.auth
              .createUserWithEmailAndPassword(_email, _password);
          //   FirebaseUser user=(await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)).user;
          print('Register: $userId');
        }
        widget.onSignedIn();
      } catch (e) {
        print('Error:$e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          title: new Text('flutter login'),
        ),
        body: SingleChildScrollView(
          child: new Container(
              padding: EdgeInsets.all(16.0),
              child: new Form(
                key: formKey,
                child: new Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch, //stretch login button
                  children: inputlogo() + buildInputs() + buildSubmitButtons(),
                ),
              )),
        ));
  }

  List<Widget> inputlogo() {
    return [logo()];
  }

  List<Widget> buildInputs() {
    return [
      new TextFormField(
        decoration:
            new InputDecoration(labelText: 'Email', focusColor: Colors.black),
        validator: (value) => value.isEmpty ? 'email can not be empty ' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        validator: (value) =>
            value.isEmpty ? 'password can not be empty ' : null,
        onSaved: (value) => _password = value,
        obscureText: true, //hide password
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
          child: new Text('Login', style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
          color: Colors.green,
        ),
        new FlatButton(
            onPressed: moveToRegister,
            child: new Text('Create an account',
                style: new TextStyle(fontSize: 20.0))),
      ];
    } else {
      return [
        new RaisedButton(
          child: new Text('Create an Account',
              style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
            onPressed: moveToLogin,
            child: new Text('Have an account?Login',
                style: new TextStyle(fontSize: 20.0))),
      ];
    }
  }
}
