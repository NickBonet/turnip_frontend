import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:turnip_frontend/stores/UserStateStore.dart';

part 'LoginStore.g.dart';

class LoginStore extends _LoginStore with _$LoginStore {
  LoginStore(UserStateStore userStateStore) : super(userStateStore);
}

abstract class _LoginStore with Store {
  final UserStateStore _userStateStore;
  _LoginStore(this._userStateStore);

  @observable
  bool isLoading = false;

  @observable 
  bool failedLogin = false;

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<void> postLogin(String email, String password) async {
    String loginUrl = 'http://192.168.2.61:3000/auth/user_token';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    Map authPayload = {
      'auth' : {
        'email' : email,
        'password' : password
      }
    };

    final response = await http.post(
      loginUrl,
      headers: {"Content-type": "application/json"},
      body: jsonEncode(authPayload)
    );

    if (response.statusCode == 201) {
      await prefs.setString('jwt', json.decode(response.body)['jwt']);
      setLoading(false);
      _userStateStore.setLoggedIn(true);
      failedLogin = false;
    }
    else if (response.statusCode == 404) {
      setLoading(false);
      _userStateStore.setLoggedIn(false);
      failedLogin = true;
    }
  }
}