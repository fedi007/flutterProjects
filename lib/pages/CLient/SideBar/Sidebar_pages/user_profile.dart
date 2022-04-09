import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iblaze/data/globals.dart';
import 'changeName.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        centerTitle: true,
        backgroundColor: Color(0xFF005b71),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 80),
                  Image.asset(
                    "images/Lg.png",
                    height: 120,
                    width: 120,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text("${currentUser?.username}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                              onTap: () {
                                Get.off(
                                  () => ChangeName(),
                                );
                              },
                              child: Icon(Icons.edit,
                                  color: Colors.grey, size: 20)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 5),
                    child: Text("${currentUser?.email}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                  ),
                  SizedBox(height: 220),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Account Created On : ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 124, 124),
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        Text("${currentUser?.creationDate}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey, fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
