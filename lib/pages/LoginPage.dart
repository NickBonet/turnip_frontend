import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:provider/provider.dart';

import 'package:turnip_frontend/stores/LoginStore.dart';
import 'package:turnip_frontend/widgets/MainAppBar.dart';

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
  
  final List<ReactionDisposer> _disposers = [];

  void dispose() {
    super.dispose();
    _disposers.forEach((disposer) {disposer();});
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers.add(
    reaction(
      (_) => Provider.of<LoginStore>(context, listen: false).loggedIn,
      (_) => Navigator.of(context).pop(),
    ),
  );
  }

  void validateLogin(loginStore) {
    final loginForm = _loginFormKey.currentState;
    if (loginForm.validate()) {
      loginStore.loginApiCall(emailController.text, pwdController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginStore = Provider.of<LoginStore>(context, listen: false);
    return Observer(
        builder: (_) => Scaffold(
        appBar: MainAppBar(title: 'Login'),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            )
          ),
          child: loginStore.isLoading ? Center(child: CircularProgressIndicator()) : 
          Center(
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
                  SizedBox(height: 10),
                  RaisedButton(
                    child: Text('Login'),
                    color: Colors.white70,
                    onPressed: () {
                      validateLogin(loginStore);
                      loginStore.setLoading(true);
                    },
                  ),
                  loginStore.failedLogin ? Text('The credentials you entered are incorrect.') : Container() // can't be null...
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}