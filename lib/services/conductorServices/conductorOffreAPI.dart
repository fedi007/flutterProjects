import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../Models/offre.dart';
import '../../data/globals.dart';

class APIOffreConductor {
  static Future<List<OffreModel>> getAllOffers( ) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET', Uri.parse('http://10.0.2.2:4000/conducteur/offer/getall'));
    request.body = json.encode({});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var Data = json.decode(await response.stream.bytesToString());

      for (var offreJson in Data) {
        AllOffres.add(new OffreModel(
            getArrivee: offreJson["arrivee"],
            getDeliveryTime: offreJson["time"],
            getDepart: offreJson["depart"],
            getFreightType: offreJson["deliveryType"],
            getId: offreJson["id"],
            getQuantity: offreJson["quantity"],
            getResponse: offreJson["load"],
            getName: offreJson["username"]));

        print(offreByName);
      }
    } else {
      print(response.reasonPhrase);
    }
    return AllOffres;
  }
}
