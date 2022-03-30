import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iblaze/Widgets/button_widget.dart';
import 'package:iblaze/pages/Register_page.dart';

import '../services/Api_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Client/TruckMachine_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordObscured = true;
  var password;
  var userName;

  String Incorrect = "";
  Color Invisible = Color.fromARGB(0, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
                child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 20.h),
                    Container(
                      height: 250.h,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            //margin: EdgeInsets.only(top: 10),
                            child: Image.asset(
                              "images/Lg.png",
                              height: 100.h,
                              width: 100.w,
                            ),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      padding: EdgeInsets.only(left: 20.w, right: 20.h),
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Invisible,
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Color(0xffEEEEEE)),
                        ],
                      ),
                      child: TextField(
                        cursorColor: Color(0xFF005b71),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Color(0xFF005b71),
                          ),
                          hintText: "Username",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (value) {
                          userName = value;
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      padding: EdgeInsets.only(left: 20.w, right: 20.h),
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffEEEEEE),
                        border: Border.all(
                          color: Invisible,
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 20),
                              blurRadius: 100,
                              color: Color(0xffEEEEEE)),
                        ],
                      ),
                      child: TextField(
                        cursorColor: Color(0xFF005b71),
                        decoration: InputDecoration(
                          focusColor: Color(0xFF005b71),
                          icon: Icon(
                            Icons.vpn_key,
                            color: Color(0xFF005b71),
                          ),
                          hintText: "Password",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordObscured = !passwordObscured;
                              });
                            },
                            icon: Icon(passwordObscured
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: passwordObscured,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.w, top: 10.h),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(Incorrect,
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 0, 0))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 25.w),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text("Forget Password?",
                              style: TextStyle(color: Color(0xFF005b71))),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 70.h),
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      height: 40.h,
                      width: 600.h,
                      child: ButtonWidget(
                          text: "LOGIN",
                          onClicked: () async {
                            await APIService.login(userName, password);

                            if (test) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TruckMachine()));
                            }
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't Have Any Account ?  "),
                          GestureDetector(
                            child: Text(
                              "Register Now",
                              style: TextStyle(color: Color(0xFF005b71)),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterPage(),
                                  ));
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ))),
      ),
    );
  }
}
