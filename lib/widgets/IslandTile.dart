import 'package:flutter/material.dart';
import 'package:turnip_frontend/models/IslandListing.dart';

class IslandTile extends StatelessWidget {
  final IslandListing _island;
  IslandTile(this._island);

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      ListTile(
        title: Text(_island.islandName),
        subtitle: Text('Dodo Code: ' + _island.dodoCode + ' Player Name: ' + _island.playerName),
      ),
      Divider()
    ],
  );
}