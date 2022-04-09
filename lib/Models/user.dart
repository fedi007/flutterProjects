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

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['username'] = username;
  //   _data['email'] = email;
  //   _data['password'] = password;
  //   return _data;
  // }
}
