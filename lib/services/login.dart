import 'dart:convert';

import 'package:http/http.dart' as http;

const base_url = "http://test.aswaag.net/api/";
Future<int> login(userName, password) async {
  http.Response response = await http.post(
    Uri.parse(base_url + "auth/login"),
    headers: {"app-lang": "1", "device-type": "1"},
    body: {
      "userName": userName.toString(),
      "password": password.toString(),
    },
  );
  print(response.body);
  if (response.statusCode == 200) {
    return response.statusCode;
  } else {
    throw Error();
  }
}
