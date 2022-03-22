import 'package:flutter/material.dart';

class User extends StatelessWidget {
  final String name;
  final String email;
  final Image pic;
  const User({
    Key? key,
    required this.name,
    required this.email,
    required this.pic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        centerTitle: true,
        backgroundColor: Color(0xFF005b71),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          pic,
          Text(name,
              style: TextStyle(
                color: Color(0xFF005b71),
              )),
          Text(email,
              style: TextStyle(
                color: Color(0xFF005b71),
              )),
        ]),
      ),
    );
  }
}
