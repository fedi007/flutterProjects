import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/offre.dart';
import '../../data/globals.dart';

bool offreCheck = false;
bool deletedOffre = false;
String creationDate = "";
var items;
List<String> dropDownBtnItem = [];
var offre = <OffreModel>[];

class APIOffreUser {
  static RegisterOffre(depart, arrivee, Response, deliveryTime, deliveryDay,
      freightType, quantity, id) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://192.168.1.8:4000/users/offer/register'));
    request.body = json.encode({
      "depart": depart,
      "arrivee": arrivee,
      "deliveryType": freightType,
      "load": Response,
      "quantity": quantity,
      "user": id,
      "time": deliveryTime,
      "daytime": deliveryDay
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

  static Future<List<OffreModel>> getOffers(id) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://192.168.1.8:4000/users/offer/getbyuser'));
    request.body = json.encode({"user": id});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    List<OffreModel> permanentOffer = [];
    if (response.statusCode == 200) {
      var Data = json.decode(await response.stream.bytesToString());
      // print(Data);
      for (var offreJson in Data) {
        permanentOffer.add(new OffreModel(
          getArrivee: offreJson["arrivee"],
          getDeliveryTime: offreJson["time"],
          getDepart: offreJson["depart"],
          getFreightType: offreJson["deliveryType"],
          getDeliveryDay: offreJson["daytime"],
          getOffreId: offreJson["id"],
          getQuantity: offreJson["quantity"],
          getResponse: offreJson["load"],
        ));

        // print(permanentOffer);
      }
    } else {
      print(response.reasonPhrase);
    }

    return permanentOffer;
  }

  static GetFreight() async {
    var request = http.Request(
        'GET', Uri.parse('http://192.168.1.8:4000/users/deliveryType/getall'));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var items = json.decode(await response.stream.bytesToString());

      items.forEach((e) {
        dropDownBtnItem.add(e);
      });
    } else {
      print(response.reasonPhrase);
    }
    dropDownBtnItem.add("other");
  }

  static deleteOffre(id) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'DELETE', Uri.parse('http://192.168.1.8:4000/users/offer/delete'));
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

  static UpdateOffre(
    offreId,
    depart,
    arrivee,
    Response,
    deliveryTime,
    deliveryDay,
    freightType,
    quantity,
  ) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PATCH', Uri.parse('http://192.168.1.8:4000/users/offer/update'));
    request.body = json.encode({
      "id": offreId,
      "depart": depart,
      "arrivee": arrivee,
      "deliveryType": freightType,
      "load": Response,
      "quantity": quantity,
      "time": deliveryTime,
      "daytime": deliveryDay
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      UpdatedOffre = true;
      print(await response.stream.bytesToString());
    } else {
      UpdatedOffre = false;
      print(response.reasonPhrase);
    }
  }

  static Future<List<UserOffers>> AcceptedOffers(userId, completedOffer) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://192.168.1.8:4000/users/offer/getacceptedoffersbyuser'));
    request.body = json.encode({"user": userId, "completeoffer": false});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    List<UserOffers> permanentOffer = [];
    if (response.statusCode == 200) {
      var Data = json.decode(await response.stream.bytesToString());

      for (var offreJson in Data) {
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
          getDate: offreJson["date"],
        ));
      }
    } else {
      print(response.reasonPhrase);
    }
    return permanentOffer;
  }

  static Completeoffer(UserId) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('PATCH',
        Uri.parse('http://192.168.1.8:4000/users/offer/useraccepteoffer'));
    request.body = json.encode({"id": UserId, "completeoffer": true});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      CompletingOffre = true;
    } else {
      CompletingOffre = false;
      print(response.reasonPhrase);
    }
  }

  static Future<List<UserOffers>> OffreCompleted(UserID) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://192.168.1.8:4000/users/offer/getacceptedoffersbyuser'));
    request.body = json.encode({"user": UserID, "completeoffer": true});
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
