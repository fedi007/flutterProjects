class User {
  User({
    required this.username,
    required this.useremail,
   
  
  });
  late final String useremail;
  late final String username;


  User.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    useremail = json["useremail"];
  
  }
}
