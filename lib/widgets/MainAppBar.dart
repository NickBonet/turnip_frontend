import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:turnip_frontend/stores/LoginStore.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  MainAppBar({Key key, this.title}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key : key);

  final String title;
  
  @override
  final Size preferredSize;

  @override
  _MainAppBar createState() => _MainAppBar();
}

class _MainAppBar extends State<MainAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginStore = Provider.of<LoginStore>(context, listen: false);
    return Observer(
        builder: (_) => AppBar(
        title: Row(
            children: [
              Image.asset('assets/images/leaf_icon.png', width:48, height: 48,),
              SizedBox(width: 10,), // spacing between leaf and text!
              Text(widget.title),
            ],),
        backgroundColor: Color(0xFF065c1b),
        actions: <Widget>[
            OutlineButton(
              onPressed: () {  },
              child: Text("Sign Up", style: TextStyle(color: Colors.white))),
            !loginStore.loggedIn ? OutlineButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Login", style: TextStyle(color: Colors.white))  
              )
            : OutlineButton(
              onPressed: () {},
              child: Text('Hello there!', style: TextStyle(color: Colors.white))
              )
          ],
      )
    );
  }
}