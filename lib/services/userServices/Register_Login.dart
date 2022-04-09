import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iblaze/Models/user.dart';
import 'package:iblaze/data/globals.dart';

bool test = false;

var items;
String creationDate = "";

class APIService {
  static Future<void> login(username, password) async {
    print('login');
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://10.0.2.2:4000/users/login'));
    request.body = json.encode({"username": username, "password": password});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      checkLogin = true;
      var Data = json.decode(await response.stream.bytesToString());
    
      var d = Data["data"]["date"];
      for (var i = 0; i < 10; i++) creationDate = creationDate + d[i];
      currentUser = new User(Data["data"]["username"], Data["data"]["email"],
          Data["data"]["password"], creationDate);
    } else {
      print(response.reasonPhrase);
      checkLogin = false;
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
      checkRegister = true;
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      checkRegister = false;
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
      checkUpdate = true;
     var data = await response.stream.bytesToString();
      var l = data.split('"');

       currentUser = new User(l[1], currentUser?.email,
          currentUser?.password, currentUser?.creationDate);
        
    } else {
      print(response.reasonPhrase);
      checkUpdate = false;
    }
  }
}
