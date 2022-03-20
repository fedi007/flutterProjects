import 'dart:convert';

import 'package:http/http.dart' as http;

bool test = false;

class APIService {
  static login(username, password) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://10.0.2.2:4000/users/login'));
    request.body = json.encode({"username": username, "password": password});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      test = true;
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      test = false;
    }
  }
  

  static Register(username, email, password) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://10.0.2.2:4000/users/register'));
    request.body = json
        .encode({"username": username, "email": email, "password": password});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      test = true;
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      test = false;
    }
  }
}
