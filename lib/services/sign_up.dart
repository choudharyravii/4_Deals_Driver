import 'dart:convert';

import 'package:http/http.dart' as http;

const base_url = "http://test.aswaag.net/api/";
Future<int> signUp(name, userName, email, password, role, mobile) async {
  http.Response response = await http.post(
    Uri.parse(base_url + "auth/signup"),
    headers: {"app-lang": "1", "device-type": "1"},
    body: {
      "name": name.toString(),
      "userName": userName.toString(),
      "email": email.toString(),
      "password": password.toString(),
      "role": role.toString(),
      "mobile": mobile.toString(),
    },
  );
  print(response.body);
  if (response.statusCode == 200) {
    return response.statusCode;
  } else {
    throw Error();
  }
}
