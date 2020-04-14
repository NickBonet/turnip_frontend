import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:turnip_frontend/widgets/MainAppBar.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  Future<http.Response> fetchLoginToken() async {
    Map authPayload = {
      'auth' : {
        'email' : emailController.text,
        'password' : pwdController.text
      }
    };

    final response = await http.post(
      'http://192.168.2.61:3000/auth/user_token',
      headers: {"Content-type": "application/json"},
      body: jsonEncode(authPayload)
    );

    if (response.statusCode == 201) {
      print(json.decode(response.body)['jwt']); 
    }
  }

  void validateLogin() {
    final loginForm = _loginFormKey.currentState;
    if (loginForm.validate()) {
      print('true');
      fetchLoginToken();
    }
    else {
      print('false');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Login'),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          )
        ),
        child: Center(
          child: Form(
              key: _loginFormKey,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[            
                FractionallySizedBox(
                  widthFactor: 0.45,
                  child: TextFormField(
                      controller: emailController,
                      validator: (String value) {
                        return validator.email(value) ? null : 'Invalid e-mail entered.';
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Colors.white70,
                        icon: Icon(Icons.account_circle),
                        labelText: 'E-mail Address'
                      ),
                    ),
                ),
                SizedBox(height: 20),
                FractionallySizedBox(
                  widthFactor: 0.45,
                  child: TextFormField(
                    controller: pwdController,
                    obscureText: true,
                    validator: (String value) {
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long.';
                      }
                      else {
                        return validator.password(value) ? null : 'Must have lowercase, uppercase, special, and numerical characters.';
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.white70,
                      icon: Icon(Icons.vpn_key),
                      labelText: 'Password'
                    ),
                  ),
                ),
                SizedBox(height: 10),
                RaisedButton(
                  child: Text('Login'),
                  color: Colors.white70,
                  onPressed: validateLogin,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
