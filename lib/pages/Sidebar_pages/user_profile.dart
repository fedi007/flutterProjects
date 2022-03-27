import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CLient/ClientPage.dart';
import 'changeName.dart';

class User extends StatefulWidget {
  final String name;
  final String email;
  final Image picture;
  const User({
    Key? key,
    required this.name,
    required this.email,
    required this.picture,
  }) : super(key: key);

  @override
  State<User> createState() => _UserState(name, email);
}

class _UserState extends State<User> {
  bool isvisible = false;
  String name;
  String email;
  _UserState(this.name, this.email);
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
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 80),
                  Image.asset(
                    "images/Lg.png",
                    height: 100.h,
                    width: 100.w,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.w, right: 30.w, top: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChangeName(),
                                  ));
                            },
                            child:
                                Icon(Icons.edit, color: Colors.grey, size: 20))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 5.h),
                    child: Text(email,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
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
