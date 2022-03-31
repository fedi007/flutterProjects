import 'dart:convert';

import 'package:http/http.dart' as http;

bool offreCheck = false;
String getDepart = "";
String getArrivee = "";
String getResponse = "";
String getDeliveryTime = "";
String getFreightType = "";
String getQuantity = "";

class APIOffre {
  static RegisterOffre(depart, arrivee, Response, deliveryTime, freightType,
      quantity, name) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://10.0.2.2:4000/users/offer/register'));
    request.body = json.encode({
      "depart": depart,
      "arrivee": arrivee,
      "deliveryType": freightType,
      "load": Response,
      "quantity": quantity,
      "username": name,
      "time": deliveryTime
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      offreCheck = true;
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      offreCheck = false;
    }
  }

  static getOffers(name) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://10.0.2.2:4000/users/offer/getbyuser'));
    request.body = json.encode({"username": name});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      
      // print(await response.stream.bytesToString());
      var data = await response.stream.bytesToString();
      var l = data.split('"');

      getDepart = l[3];
      getArrivee = l[7];
      getFreightType = l[11];
      //Name
      getQuantity = l[19];
      getDeliveryTime = l[23];
      getResponse = l[27];

      print(getDepart);
      print(getArrivee);
      print(getFreightType);
      print(getQuantity);
      print(getDeliveryTime);
      print(getResponse);
    } else {
      
      print(response.reasonPhrase);
    }
  }
}
