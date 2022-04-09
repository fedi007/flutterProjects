import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iblaze/Models/conductor.dart';
import 'package:iblaze/data/globals.dart';

import '../../Models/user.dart';

String creationDate = "";

class APIServiceConductor {
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
      "TruckLicensePlate": trucklicense,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      checkRegisterCondcuctor = true;
    } else {
      print(response.reasonPhrase);
      checkRegisterCondcuctor = false;
    }
  }

  static LoginConductor(username, password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://10.0.2.2:4000/conducteur/login'));
    request.body = json.encode({"username": username, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      checkLoginCondcuctor = true;
      var Data = json.decode(await response.stream.bytesToString());

      var d = Data["data"]["date"];
      for (var i = 0; i < 10; i++) creationDate = creationDate + d[i];
      currentConductor = new Conductor(
          Data["data"]["username"],
          Data["data"]["email"],
          //  Data["data"]["password"],
          Data["data"]["TruckLicensePlate"],
          Data["data"]["TruckModel"],
          creationDate);
    } else {
      print(response.reasonPhrase);
      checkLoginCondcuctor = false;
    }
  }
}
