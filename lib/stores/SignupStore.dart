import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'SignupStore.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  @observable
  bool isLoading = false;

  @observable 
  bool successfulSignup = false;

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<void> postSignup(String email, String password, String username, String passwordConfirm) async {
    String signupUrl = 'http://192.168.2.61:3000/auth/users/';
    
    Map authPayload = {
      'email' : email,
      'username': username,
      'password' : password,
      'password_confirm' : passwordConfirm
    };

    final response = await http.post(
      signupUrl,
      headers: {"Content-type": "application/json"},
      body: jsonEncode(authPayload)
    );

    if (response.statusCode == 201) {
      setLoading(false);
      successfulSignup = true;
    }
    else if (response.statusCode == 422) {
      setLoading(false);
      successfulSignup = false;
    }
  }
}