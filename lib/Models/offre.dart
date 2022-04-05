class OffreModel {
  OffreModel({
    required this.getDepart,
    required this.getArrivee,
    required this.getResponse,
    required this.getDeliveryTime,
    required this.getFreightType,
    required this.getQuantity,
    required this.getId,
  });
  late final String getDepart;
  late final String getArrivee;
  late final String getResponse;
  late final String getDeliveryTime;
  late final String getFreightType;
  late final String getQuantity;
  late final String getId;

  OffreModel.fromJson(Map<String, dynamic> json) {
    getDepart = json["depart"];
    getArrivee = json["arrivee"];
    getResponse = json["load"];
    getDeliveryTime = json["time"];
    getFreightType = json["deliveryType"];
    getQuantity = json["quantity"];
    getId = json["id"];
  }
}
