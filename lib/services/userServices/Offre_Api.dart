import 'dart:convert';

import 'package:http/http.dart' as http;

bool offreCheck = false;
List getDepart = [];
List getArrivee = [];
List getResponse = [];
List getDeliveryTime = [];
List getFreightType = [];
List getQuantity = [];
var offreCount;
var items;
List<String> dropDownBtnItem = [];

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
      items = json.decode(await response.stream.bytesToString());
      items.forEach((e) {
        getDepart.add(e["depart"]);
        getArrivee.add(e["arrivee"]);
        getResponse.add(e["load"]);
        getDeliveryTime.add(e["time"]);
        getFreightType.add(e["deliveryType"]);
        getQuantity.add(e["quantity"]);
      });
    } else {
      print(response.reasonPhrase);
    }
    offreCount = items.length;
  }

  static GetFreight() async {
    var request = http.Request(
        'GET', Uri.parse('http://10.0.2.2:4000/users/deliveryType/getall'));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var items = json.decode(await response.stream.bytesToString());
      items.forEach((e) {
        dropDownBtnItem.add(e);
      });
    } else {
      print(response.reasonPhrase);
    }
  }
}
