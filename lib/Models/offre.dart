class OffreModel {
  OffreModel({
    required this.getDepart,
    required this.getArrivee,
    required this.getResponse,
    required this.getDeliveryTime,
    required this.getFreightType,
    required this.getQuantity,
    required this.getOffreId,
    required this.getDeliveryDay,
  });
  late final String getDepart;
  late final String getArrivee;
  late final String getResponse;
  late final String getDeliveryTime;
  late final String getDeliveryDay;
  late final String getFreightType;
  late final String getQuantity;
  late final String getOffreId;

  OffreModel.fromJson(Map<String, dynamic> json) {
    getDepart = json["depart"];
    getArrivee = json["arrivee"];
    getResponse = json["load"];
    getDeliveryTime = json["time"];
    getDeliveryTime = json["daytime"];
    getFreightType = json["deliveryType"];
    getQuantity = json["quantity"];
    getOffreId = json["id"];
  }
}

class AllOffers {
  AllOffers(
      {required this.getDepart,
      required this.getArrivee,
      required this.getResponse,
      required this.getDeliveryTime,
      required this.getFreightType,
      required this.getQuantity,
      required this.getOffreId,
      required this.getDeliveryDay,
      required this.getUsername});
  late final String getDepart;
  late final String getArrivee;
  late final String getResponse;
  late final String getDeliveryTime;
  late final String getDeliveryDay;
  late final String getFreightType;
  late final String getQuantity;
  late final String getOffreId;
  late final String getUsername;
  AllOffers.fromJson(Map<String, dynamic> json) {
    getArrivee = json["arrivee"];
    getDepart = json["depart"];
    getFreightType = json["deliveryType"];
    getUsername = json["user"]["username"];
    getQuantity = json["quantity"];
    getDeliveryTime = json["time"];
    getDeliveryTime = json["daytime"];
    getResponse = json["load"];
    getOffreId = json["id"];
  }
}

class RegisteredOffers {
  RegisteredOffers({
    required this.getDepart,
    required this.getArrivee,
    required this.getResponse,
    required this.getDeliveryTime,
    required this.getFreightType,
    required this.getQuantity,
    required this.getOffreId,
    required this.getDeliveryDay,
    // required this.getUsername,
    required this.getTruckName,
    required this.getPrice,
    required this.getDescription,
  });
  late final String getDepart;
  late final String getArrivee;
  late final String getResponse;
  late final String getDeliveryTime;
  late final String getDeliveryDay;
  late final String getFreightType;
  late final String getQuantity;
  late final String getOffreId;
  // late final String getUsername;
  late final String getTruckName;
  late final int getPrice;
  late final String getDescription;

  RegisteredOffers.fromJson(Map<String, dynamic> json) {
    getArrivee = json["offer"]["arrivee"];
    getDepart = json["offer"]["depart"];
    getFreightType = json["offer"]["deliveryType"];
    // getUsername = json["offer"]["user"]["username"];
    getQuantity = json["offer"]["quantity"];
    getDeliveryTime = json["offer"]["time"];
    getDeliveryTime = json["offer"]["daytime"];
    getResponse = json["offer"]["load"];
    getOffreId = json["id"];
    getTruckName = json["truck"]["truckModel"];
    getPrice = json["price"];
    getDescription = json["description"];
  }
}

class UserOffers {
  UserOffers({
    required this.getDepart,
    required this.getArrivee,
    required this.getResponse,
    required this.getDeliveryTime,
    required this.getFreightType,
    required this.getQuantity,
    required this.getOffreId,
    required this.getDeliveryDay,
    required this.getConductorName,
    required this.getTruckName,
    required this.getPrice,
    required this.getDescription,
    required this.getDate,
  });
  late final String getDepart;
  late final String getArrivee;
  late final String getResponse;
  late final String getDeliveryTime;
  late final String getDeliveryDay;
  late final String getFreightType;
  late final String getQuantity;
  late final String getOffreId;
  late final String getConductorName;
  late final String getTruckName;
  late final int getPrice;
  late final String getDescription;
  late final String getDate;

  UserOffers.fromJson(Map<String, dynamic> json) {
    getArrivee = json["offer"]["arrivee"];
    getDepart = json["offer"]["depart"];
    getFreightType = json["offer"]["deliveryType"];
    getConductorName = json["conducteur"]["username"];
    getQuantity = json["offer"]["quantity"];
    getDeliveryTime = json["offer"]["time"];
    getDeliveryTime = json["offer"]["daytime"];
    getResponse = json["offer"]["load"];
    getOffreId = json["id"];
    getTruckName = json["truck"]["truckModel"];
    getPrice = json["price"];
    getDescription = json["description"];
    getDate = getDate;
  }
    Map<String, dynamic> toJson() => {
      "offer"'arrivee': getArrivee,
      "offer" 'depart': getDepart,
      "offer" 'deliveryType': getFreightType,
      "conducteur" 'username': getConductorName,
      "offer" 'quantity': getQuantity,
      "offer" 'time': getDeliveryTime,
      "offer" 'daytime': getDeliveryTime,
      "offer" 'load': getResponse,
      'id':getOffreId,
      "truck" 'truckModel': getTruckName,
      'price' : getPrice ,
      'description': getPrice,
    
      };
}
