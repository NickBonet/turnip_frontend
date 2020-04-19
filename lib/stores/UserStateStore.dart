import 'package:mobx/mobx.dart';

part 'UserStateStore.g.dart';

class UserStateStore = _UserStateStore with _$UserStateStore;

abstract class _UserStateStore with Store {
  @observable
  bool loggedIn = false;

  @action
  void setLoggedIn(bool value) {
    loggedIn = value;
  }
}