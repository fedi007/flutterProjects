import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iblaze/Models/user.dart';
import 'package:iblaze/data/globals.dart';

bool checkup = false;
var isDr;

var items;
String creationDate = "";

class APIServiceUser {
  static Future<void> login(username, password) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://192.168.1.8:4000/users/login'));
    request.body = json.encode({"username": username, "password": password});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      checkLogin = true;
      var Data = json.decode(await response.stream.bytesToString());

      var date = Data["data"]["date"];
      for (var i = 0; i < 10; i++) creationDate = creationDate + date[i];
      currentUser = new User(
          Data["data"]["username"],
          Data["data"]["email"],
          Data["data"]["password"],
          creationDate,
          Data["data"]["id"],
          Data["data"]["isdriver"]);
      var isDriver = currentUser?.isdriver != null;
      isDr = Data["data"]["isdriver"];
    } else {
      print(response.reasonPhrase);
      checkLogin = false;
    }
  }

  static Register(username, email, password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://192.168.1.8:4000/users/register'));
    request.body = json
        .encode({"username": username, "email": email, "password": password});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      checkRegister = true;
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      checkRegister = false;
    }
  }

  static Update(Lastusername, Username) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PATCH', Uri.parse('http://192.168.1.8:4000/users/update'));
    request.body = json.encode({
      "username": Username,
      "lastusername": Lastusername,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      checkUpdate = true;
      var data = await response.stream.bytesToString();
      var l = data.split('"');

      currentUser = new User(
        l[3],
        currentUser?.email,
        currentUser?.password,
        currentUser?.creationDate,
        currentUser?.id,
        currentUser?.isdriver,
      );
    } else {
      print(response.reasonPhrase);
      checkUpdate = false;
    }
  }

  static UpdateStatus(Lastusername) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PATCH', Uri.parse('http://192.168.1.8:4000/users/update'));
    request.body =
        json.encode({"lastusername": Lastusername, "isdriver": true});
    // currentUser?.isdriver = true;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      checkUpdate = true;
      var data = await response.stream.bytesToString();
      var l = data.split('"');

      currentUser = new User(
        currentUser?.email,
        currentUser?.email,
        currentUser?.password,
        currentUser?.creationDate,
        currentUser?.id,
        currentUser?.isdriver,
      );
    } else {
      print(response.reasonPhrase);
      checkUpdate = false;
    }
  }
}
