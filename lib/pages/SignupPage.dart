import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:regexed_validator/regexed_validator.dart';

import 'package:turnip_frontend/stores/SignupStore.dart';
import 'package:turnip_frontend/widgets/MainAppBar.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController(), pwdController = TextEditingController();
  final usernameController = TextEditingController(), pwdConfirmController = TextEditingController();
  final _signupFormKey = GlobalKey<FormState>();
  final signupStore = SignupStore();

  void dispose() {
    super.dispose();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void validateSignUp() {
    final signupForm = _signupFormKey.currentState;
    if (signupForm.validate()) {
      signupStore.setLoading(true);
      signupStore.postSignup(emailController.text, pwdController.text, usernameController.text, pwdConfirmController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
        appBar: MainAppBar(title: 'Sign Up'),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            )
          ),
          child: signupStore.isLoading ? Center(child: CircularProgressIndicator()) : 
          Center(
            child: Form(
                key: _signupFormKey,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[     
                  FractionallySizedBox(
                    widthFactor: 0.45,
                    child: TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Colors.white70,
                        icon: Icon(Icons.account_circle),
                        labelText: 'Username'
                      ),
                    ),
                  ),      
                  SizedBox(height: 20), 
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
                          icon: Icon(Icons.email),
                          labelText: 'E-mail Address'
                        ),
                      ),
                  ),
                  SizedBox(height: 20),
                  FractionallySizedBox(
                    widthFactor: 0.45,
                    child: TextFormField(
                      controller: pwdController,
                      validator: (String value) {
                        return validator.password(value) ? null : "Password does not meet minimum requirements.";
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Colors.white70,
                        icon: Icon(Icons.vpn_key),
                        labelText: 'Password'
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  FractionallySizedBox(
                    widthFactor: 0.45,
                    child: TextFormField(
                      controller: pwdConfirmController,
                      validator: (String value) {
                        return value == pwdController.text ? null : 'Passwords do not match.';
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Colors.white70,
                        icon: Icon(Icons.vpn_key),
                        labelText: 'Confirm password above'
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    child: Text('Sign Up'),
                    color: Colors.white70,
                    onPressed: () {
                      validateSignUp();
                    },
                  ),
                  signupStore.successfulSignup ? Text('Sign up successful!') : Container(),
                  signupStore.signUpAttempted && !signupStore.successfulSignup ? Text('Sign up failed.') : Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}