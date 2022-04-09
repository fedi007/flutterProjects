class Conductor {
  Conductor(
    this.conductorName,
    this.condcutorEmail,
   // this.Condiuctorpassword,
    this.TruckLicensePlate,
    this.TruckModel,
    this.creationDate,
  );
  late final String? conductorName;
  late final String? condcutorEmail;
  //late final String? Condiuctorpassword;
  late final TruckLicensePlate;
  late final TruckModel;
  late final String? creationDate;

  Conductor.fromJson(Map<String, dynamic> json) {
    conductorName = json['username'];
    condcutorEmail = json['email'];
  //  Condiuctorpassword = json['password'];
    TruckLicensePlate = json['TruckLicensePlate'];
    TruckModel = json['TruckModel'];
    creationDate = creationDate;
  }

}
