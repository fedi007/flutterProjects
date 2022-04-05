import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Models/offre.dart';

bool offreCheck = false;

//var offreCount;
var items;
var offre = <OffreModel>[];
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

  static  getOffers(name) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://10.0.2.2:4000/users/offer/getbyuser'));
    request.body = json.encode({"username": name});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      
      items = json.decode(await response.stream.bytesToString());

      for (var offreJson in items) {
        offre.add(OffreModel.fromJson(offreJson));
      }
    } else {
      print(response.reasonPhrase);
    }

    return offre;
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

  static deleteOffre(id) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'DELETE', Uri.parse('http://10.0.2.2:4000/users/offer/delete'));
    request.body = json.encode({"id": id});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
