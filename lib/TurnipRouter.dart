import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:turnip_frontend/pages/HomePage.dart';
import 'package:turnip_frontend/pages/LoginPage.dart';
import 'package:turnip_frontend/pages/SignupConfPage.dart';
import 'package:turnip_frontend/pages/SignupPage.dart';

class TurnipRouter {
  static Router router = Router();

  static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => LoginPage());
  static Handler _signupHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => SignupPage());
  static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => HomePage());
  static Handler _signupConfHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String email = params.containsKey('email') ? params['email']?.first : '';
    String token = params.containsKey('token') ? params['token']?.first : '';

    return SignupConfPage(email: email, token: token);
  });

  static void setupRouter() {
    router.define('/', handler: _homeHandler);
    router.define('/login', handler: _loginHandler);
    router.define('/signup', handler: _signupHandler);
    router.define('/confirm_signup', handler: _signupConfHandler);
  }
}