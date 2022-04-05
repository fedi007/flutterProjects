import 'dart:convert';

import 'package:http/http.dart' as http;

bool check = false;
String conductorEmail = "";
String conductorName = "";
String truckModel = "";
String truckLicense = "";
String creationDate = "";
String RegisterDate = "";

class APIService {
  /*static RegisterConductor(username, email, password,truckmodel,trucklicense) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://10.0.2.2:4000/conducteur/register'));
    request.body = json .encode({
        "username": username, 
        "email": email,
        "password": password,
        "TruckModel":truckModel,
        "TruckLicense":truckLicense,
         });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      check = true;
      var listclientdata = json.decode(await response.stream.bytesToString());
      print (await response.stream.bytesToString());
      conductorEmail = listclientdata["data"]["email"];
      conductorName = listclientdata["data"]["username"];
      truckLicense = listclientdata["data"]["email"];
      truckModel = listclientdata["data"]["username"];
    } else {
      print(response.reasonPhrase);
      check = false;
    }
  }*/

  static RegisterConductor(
      username, email, password, truckmodel, trucklicense) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://10.0.2.2:4000/conducteur/register'));
    request.body = json.encode({
      "username": username,
      "email": email,
      "password": password,
      "TruckModel": truckmodel,
      "TruckLicense": trucklicense
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      check = true;
      //var listclientdata = json.decode(await response.stream.bytesToString());
      print(await response.stream.bytesToString());
      // conductorEmail = listclientdata["data"]["email"];
      // conductorName = listclientdata["data"]["username"];
      // truckLicense = listclientdata["data"]["email"];
      // truckModel = listclientdata["data"]["username"];
      // RegisterDate = listclientdata["data"]["date"];
    } else {
      check = false;
      print(response.reasonPhrase);
    }
  }
}
