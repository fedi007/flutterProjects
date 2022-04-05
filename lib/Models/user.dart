class User {

  User({
    required this.username,
    required this.email,
    required this.date,
    required this.id,
    required this.token,
  });
    late final String username;
  late final String email;
  late final String date;
  late final String id;
  late final String token;

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    date = json['date'];
    id = json['id'];
    token = json['token'];
  }
}
