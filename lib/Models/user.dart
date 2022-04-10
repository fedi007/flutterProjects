class User {
  User(
    this.username,
    this.email,
    this.password,
    this.creationDate,
  );
  late final String? username;
  late final String? email;
  late final String? password;
  late final String? creationDate;

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    creationDate = creationDate;
  }
}
