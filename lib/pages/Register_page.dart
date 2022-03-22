import 'package:flutter/material.dart';
import 'package:iblaze/pages/TruckMachine_page.dart';
import 'package:http/http.dart' as http;
import '../services/Api_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordObscured = true;
  var email;
  var password;
  var userName;

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
                    child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Container(
                      height: 200.h,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50.h),
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
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 70.h),
                      padding: EdgeInsets.only(left: 20.w, right: 20.r),
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
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
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200],
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
                            Icons.email,
                            color: Color(0xFF005b71),
                          ),
                          hintText: "Email",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffEEEEEE),
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
                          hintText: " Password",
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
                        obscureText: passwordObscured,
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50.h),
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      height: 40.h,
                      width: 600.h,
                      child: ElevatedButton(
                        onPressed: () async {
                          await APIService.Register(userName, email, password);

                          if (test) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          }
                        },
                        child: Text(
                          "REGISTER",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF005b71),
                          ),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" Already Member ?  "),
                          GestureDetector(
                            child: Text(
                              "Login Now",
                              style: TextStyle(color: Color(0xFF005b71)),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                            },
                          )
                        ],
                      ),
                    )
                  ],
                )),
              ),
            ));
  }
}
