import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:turnip_frontend/stores/LoginStore.dart';
import 'package:turnip_frontend/widgets/MainAppBar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final loginStore = Provider.of<LoginStore>(context, listen: false);
    return Observer(
      builder: (_) => Scaffold(
        appBar: MainAppBar(title: 'Project Turnip'),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Aint shit here yet chief',
                  style: TextStyle(color: Colors.white)
                ),
                loginStore.loggedIn ? Text('Whats poppin logged in user?') : Container()
              ],
            ),
          ),
        ),
      )
    );
  }
}