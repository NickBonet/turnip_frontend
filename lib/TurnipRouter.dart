import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:turnip_frontend/pages/HomePage.dart';
import 'package:turnip_frontend/pages/LoginPage.dart';
import 'package:turnip_frontend/pages/SignupPage.dart';

class TurnipRouter {
  static Router router = Router();

  static Handler _loginHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => LoginPage());
  static Handler _signupHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => SignupPage());
  static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => HomePage());

  static void setupRouter() {
    router.define('login', handler: _loginHandler);
    router.define('signup', handler: _signupHandler);
    router.define('home', handler: _homeHandler);
  }
}