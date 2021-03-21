import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPass = '';

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      print(_userEmail);
      print(_userName);
      print(_userPass);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('email'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                    ),
                    validator: (val) {
                      if (val.isEmpty || !val.contains('@')) {
                        return 'Please enter a valid email address';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _userEmail = value;
                    },
                  ),
                  if (!isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: (val) {
                        if (val.isEmpty || val.length < 3) {
                          return 'Please enter a value greater than 3';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _userName = value;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (val) {
                      if (val.isEmpty || val.length < 7) {
                        return 'Password should be atleast 8 character';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _userPass = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    // textColor: Theme.of(context).buttonColor,
                    onPressed: _trySubmit,
                    child: Text(isLogin ? 'login' : 'SignUp'),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(isLogin
                        ? 'Create new account'
                        : 'I have already an account'),
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
