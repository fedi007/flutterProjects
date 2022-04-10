import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iblaze/services/userServices/Register_Login.dart';

import '../../Models/offre.dart';
import '../../data/globals.dart';

bool offreCheck = false;
bool deletedOffre = false;

var items;
List<String> dropDownBtnItem = [];
var offre = <OffreModel>[];

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

  static Future<List<OffreModel>> getOffers(name) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://10.0.2.2:4000/users/offer/getbyuser'));
    request.body = json.encode({"username": name});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var Data = json.decode(await response.stream.bytesToString());

      for (var offreJson in Data) {
        currentOffre.add(new OffreModel(
            getArrivee: offreJson["arrivee"],
            getDeliveryTime: offreJson["time"],
            getDepart: offreJson["depart"],
            getFreightType: offreJson["deliveryType"],
            getId: offreJson["id"],
            getQuantity: offreJson["quantity"],
            getResponse: offreJson["load"]));

        print(currentOffre);
      }
    } else {
      print(response.reasonPhrase);
    }
    return currentOffre;
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
      deletedOffre = true;
    } else {
      deletedOffre = false;
      print(response.reasonPhrase);
    }
  }
}
