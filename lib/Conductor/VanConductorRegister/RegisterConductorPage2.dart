import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterConductorPageTruckModel extends StatefulWidget {
  const RegisterConductorPageTruckModel({Key? key}) : super(key: key);

  @override
  State<RegisterConductorPageTruckModel> createState() =>
      _RegisterConductorPageTruckModelState();
}

class _RegisterConductorPageTruckModelState
    extends State<RegisterConductorPageTruckModel> {
  bool passwordObscured = true;
  var TruckLicense;

  var TruckModel;

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
                            FontAwesomeIcons.truck,
                            color: Color(0xFF005b71),
                          ),
                          hintText: "Truck Model",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (value) {
                          TruckModel = value;
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
                          icon: Image.asset(
                            "images/plate.png",
                            color: Color(0xFF005b71),
                          ),
                          hintText: "Truck License",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (value) {
                          TruckLicense = value;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50.h),
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      height: 40.h,
                      width: 600.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Register",
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
                  ],
                )),
              ),
            ));
  }
}
