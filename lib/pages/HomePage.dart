import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:turnip_frontend/stores/HomeStore.dart';
import 'package:turnip_frontend/widgets/IslandTile.dart';
import 'package:turnip_frontend/widgets/MainAppBar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeStore = HomeStore();

  @override
  void initState() {
    super.initState();
    homeStore.setLoading(true);
    homeStore.getIslands();
  }

  @override
  Widget build(BuildContext context) {
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
          child: homeStore.isLoading ? Center(child: CircularProgressIndicator()) : Center(
            child: ListView.builder(itemCount: homeStore.islandList.length,
                                    itemBuilder: (context, index) => IslandTile(homeStore.islandList[index]))
          ),
        ),
      )
    );
  }
}