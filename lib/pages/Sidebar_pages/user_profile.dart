import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CLient/ClientPage.dart';

class User extends StatefulWidget {
  final String name;
  final String email;
  //final Image pic;
  const User({
    Key? key,
    required this.name,
    required this.email,
    // required this.pic,
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
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Color(0xFF005b71),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Form(
                child: TextFormField(
                  decoration: InputDecoration(
                      // enabled: false,
                      icon: Icon(
                    Icons.person,
                    color: Color(0xFF005b71),
                  )),
                  initialValue: name,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  onChanged: (text) {
                    isvisible = true;
                  },
                  
                  
                ),
              ),
              TextFormField(
                  decoration: InputDecoration(
                    enabled: false,
                    icon: Icon(
                      Icons.email,
                      color: Color(0xFF005b71),
                    ),
                  ),
                  readOnly: true,
                  initialValue: email,
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  )),
              SizedBox(
                height: 35,
              ),
              Visibility(
                visible: isvisible,
                child: Container(
                  margin: EdgeInsets.only(top: 50.h),
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  height: 40.h,
                  width: 600.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => User(
                                  name: name,
                                  email: email,
                                )),
                      );
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF005b71),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
