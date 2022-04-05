import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../services/userServices/Register_Login.dart';
import 'changeName.dart';

class UserProfile extends StatefulWidget {
  final String name;
  final String email;
  final Image picture;
  final String Date;
  const UserProfile({
    Key? key,
    required this.name,
    required this.email,
    required this.picture,
    required this.Date,
  }) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState(name, email, Date);
}

class _UserProfileState extends State<UserProfile> {
  bool isvisible = false;
  String name;
  String email;
  String date;
  _UserProfileState(this.name, this.email, this.date);
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
                  SizedBox(height: 220.h),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 30.w, right: 30.w, top: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Account Created On : ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 124, 124),
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        Text(date,
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
