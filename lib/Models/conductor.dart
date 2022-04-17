class Conductor {
  Conductor(
    this.conductorName,
    this.condcutorEmail,
    this.Truck,
    this.creationDate,
    this.conductorId,
  );
  late final String? conductorName;
  late final String? condcutorEmail;
  late final Truck;
  late final String? creationDate;
  late final String? conductorId;

  Conductor.fromJson(Map<String, dynamic> json) {
    conductorName = json['username'];
    condcutorEmail = json['email'];
    Truck = json["truck"];
    creationDate = creationDate;
    conductorId = json["id"];
  }
}
