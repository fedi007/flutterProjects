class User {
  User(
    this.username,
    this.email,
    this.password,
    this.creationDate,
    this.id,
    this.isdriver,
  );
  late final String? username;
  late final String? email;
  late final String? password;
  late final String? creationDate;
  late final String? id;
  late final bool? isdriver;

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    creationDate = creationDate;
    id = json["id"];
    isdriver = json["isdriver"];
  }
}
