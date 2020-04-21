import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:regexed_validator/regexed_validator.dart';

import 'package:turnip_frontend/stores/SignupConfStore.dart';
import 'package:turnip_frontend/widgets/MainAppBar.dart';

class SignupConfPage extends StatefulWidget {
  SignupConfPage({Key key, String email, String token}) : this.email = email, this.token = token, super(key: key);

  final String email;
  final String token;

  @override
  _SignupConfPageState createState() => _SignupConfPageState(email, token);
}

class _SignupConfPageState extends State<SignupConfPage> {
  final String _email;
  final String _token; 
  _SignupConfPageState(this._email, this._token);
  final signupConfStore = SignupConfStore();

  bool validateParams() {
    if (!validator.email(this._email) || this._token == '') {
      return false;
    }
    else {
      return true;
    }
  }

  void submitConfirmation() {
    if (validateParams()) {
      signupConfStore.setLoading(true);
      signupConfStore.postSignupConf(_email, _token);
    }
    else {
      signupConfStore.invalidParams = true;
    }
  }

  @override
  void initState() {
    super.initState();
    submitConfirmation();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
        appBar: MainAppBar(title: 'Sign Up Confirmation'),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            )
          ),
          child:  signupConfStore.isLoading ? Center(child: CircularProgressIndicator()) : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                signupConfStore.invalidParams ? Text('Invalid parameters specified.') : Container(),
                signupConfStore.signupConfirmed && signupConfStore.confirmAttempted ? Text('Your account is confirmed.') : Text('Sign up confirmation failed.')
              ]
            )
          ),
        ),
      ),
    );
  }
}