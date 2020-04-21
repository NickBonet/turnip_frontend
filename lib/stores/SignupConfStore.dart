import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

part 'SignupConfStore.g.dart';

class SignupConfStore = _SignupConfStore with _$SignupConfStore;

abstract class _SignupConfStore with Store {
  @observable
  bool isLoading = false;

  @observable
  bool signupConfirmed = false;

  @observable
  bool confirmAttempted = false;

  @observable
  bool invalidParams = false;

  @action
  void setLoading(bool value) {
    isLoading = value;
  }

  @action
  Future<void> postSignupConf(String email, String token) async {
    String confirmUrl = '${DotEnv().env['API_URL']}/auth/signup_confirm/';
    
    Map confirmPayload = {
      'email' : email,
      'confirm_token': token
    };

    final response = await http.post(
      confirmUrl,
      headers: {"Content-type": "application/json"},
      body: jsonEncode(confirmPayload)
    );

    if (response.statusCode == 404) {
      setLoading(false);
      signupConfirmed = false;
      confirmAttempted = true;
      invalidParams = false;
    }
    else if (response.statusCode == 200) {
      setLoading(false);
      signupConfirmed = true;
      confirmAttempted = true;
      invalidParams = false;
    }
  }
}