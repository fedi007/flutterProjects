import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/offre.dart';
import '../../data/globals.dart';

String creationDate = "";

class APIOffreConductor {
  static Future<List<AllOffers>> getAllOffers(userId, conductorId) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://192.168.1.8:4000/conducteur/offer/getall'));
    request.body = json.encode({
      "user": userId,
      "conducteur": conductorId,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    List<AllOffers> permanentOffer = [];
    if (response.statusCode == 200) {
      var Data = json.decode(await response.stream.bytesToString());

      for (var offreJson in Data) {
        permanentOffer.add(new AllOffers(
          getArrivee: offreJson["arrivee"],
          getDepart: offreJson["depart"],
          getFreightType: offreJson["deliveryType"],
          getUsername: offreJson["user"]["username"],
          getQuantity: offreJson["quantity"],
          getDeliveryTime: offreJson["time"],
          getDeliveryDay: offreJson["daytime"],
          getResponse: offreJson["load"],
          getOffreId: offreJson["id"],
        ));
      }
    } else {
      print(response.reasonPhrase);
    }
    return permanentOffer;
  }

  static RegisterOffre(
      offreID, ConductorId, TruckID, Price, Description) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://192.168.1.8:4000/conducteur/offer/register'));
    request.body = json.encode({
      "offer": offreID,
      "conducteur": ConductorId,
      "truck": TruckID,
      "price": Price,
      "description": Description
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      ConductorRegisteringOffre = true;
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      ConductorRegisteringOffre = false;
    }
  }

  static Future<List<RegisteredOffers>> allRegisteredOffers(
      ConductorId, CompletedOffer) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://192.168.1.8:4000/conducteur/offer/getacceptedoffersbyconducteur'));
    request.body = json
        .encode({"conducteur": ConductorId, "completeoffer": CompletedOffer});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    List<RegisteredOffers> permanentOffer = [];
    if (response.statusCode == 200) {
      var Data = json.decode(await response.stream.bytesToString());

      for (var offreJson in Data) {
        permanentOffer.add(new RegisteredOffers(
          getOffreId: offreJson["id"],
          getArrivee: offreJson["offer"]["arrivee"],
          getDepart: offreJson["offer"]["depart"],
          getFreightType: offreJson["offer"]["deliveryType"],
          // getUsername: offreJson["offer"]["user"]["username"],
          getQuantity: offreJson["offer"]["quantity"],
          getDeliveryTime: offreJson["offer"]["time"],
          getDeliveryDay: offreJson["offer"]["daytime"],
          getResponse: offreJson["offer"]["load"],
          getDescription: offreJson["description"],
          getPrice: offreJson["price"],
          getTruckName: offreJson["truck"]["truckModel"],
        ));
      }
    } else {
      print(response.reasonPhrase);
    }
    return permanentOffer;
  }

  static DeleteOffre(offreID) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'DELETE', Uri.parse('http://192.168.1.8:4000/conducteur/offer/delete'));
    request.body = json.encode({"conducteuroffer": offreID});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      DeletedOffreConductor = true;
    } else {
      DeletedOffreConductor = false;
      print(response.reasonPhrase);
    }
  }

  static Future offreCompleted(ConductorID) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://192.168.1.8:4000/conducteur/offer/getacceptedoffersbyconducteur'));
    request.body =
        json.encode({"conducteur": ConductorID, "completeoffer": true});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    List<UserOffers> permanentOffer = [];
    if (response.statusCode == 200) {
      var Data = json.decode(await response.stream.bytesToString());

      for (var offreJson in Data) {
        var date = offreJson["date"];
        for (var i = 0; i < 10; i++) creationDate = creationDate + date[i];
        permanentOffer.add(new UserOffers(
          getOffreId: offreJson["id"],
          getArrivee: offreJson["offer"]["arrivee"],
          getDepart: offreJson["offer"]["depart"],
          getFreightType: offreJson["offer"]["deliveryType"],
          getConductorName: offreJson["conducteur"]["username"],
          getQuantity: offreJson["offer"]["quantity"],
          getDeliveryTime: offreJson["offer"]["time"],
          getDeliveryDay: offreJson["offer"]["daytime"],
          getResponse: offreJson["offer"]["load"],
          getDescription: offreJson["description"],
          getPrice: offreJson["price"],
          getTruckName: offreJson["truck"]["truckModel"],
          getDate: creationDate,
        ));
      }
    } else {
      print(response.reasonPhrase);
    }
    return permanentOffer;
  }
}
