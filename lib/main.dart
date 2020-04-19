import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turnip_frontend/pages/SignupPage.dart';
import 'package:turnip_frontend/pages/HomePage.dart';
import 'package:turnip_frontend/pages/LoginPage.dart';
import 'package:turnip_frontend/stores/UserStateStore.dart';

void main() => runApp(
  Provider(
    create: (context) => UserStateStore(),
    child: TurnipApp()
  )
);

class TurnipApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Turnip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Project Turnip'),
      routes: <String, WidgetBuilder> {
        '/home' : (BuildContext context) => HomePage(),
        '/login' : (BuildContext context) => LoginPage(),
        '/signup' : (BuildContext context) => SignupPage(),
      }
    );
  }
}




