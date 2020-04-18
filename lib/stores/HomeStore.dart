import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:turnip_frontend/models/IslandListing.dart';

part 'HomeStore.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  bool isLoading = false;

  @observable
  List<IslandListing> islandList = List();

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<void> getIslands() async {
    setLoading(true);
    String islandUrl = "http://192.168.2.61:3000/api/islands/all";

    final response = await http.get(
      islandUrl,
      headers: {"Content-type": "application/json"}
    );

    if (response.statusCode == 200) {
      var list = json.decode(response.body) as List;
      islandList = list.map((i)=>IslandListing.fromJson(i)).toList();
      setLoading(false);
    }
  }
}