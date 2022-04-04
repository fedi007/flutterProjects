import 'dart:convert';

import 'package:http/http.dart' as http;

bool test = false;
String Email = "";
String Name = "";
var items;
String creationDate = "";

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
      var listclientdata = json.decode(await response.stream.bytesToString());
      Email = listclientdata["data"]["email"];
      Name = listclientdata["data"]["username"];

      var d = listclientdata["data"]["date"];
      for (var i = 0; i < 10; i++) creationDate = creationDate + d[i];
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

  static Update(Lastusername, Username) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('PATCH', Uri.parse('http://10.0.2.2:4000/users/update'));
    request.body =
        json.encode({"username": Username, "lastusername": Lastusername});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      test = true;
      var data = await response.stream.bytesToString();
      var l = data.split('"');

      Name = l[1];
    } else {
      print(response.reasonPhrase);
      test = false;
    }
  }
}
