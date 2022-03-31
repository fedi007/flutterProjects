import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'VanConductorRegister/RegisterConductorPage1.dart';



class TruckMachineRegister extends StatefulWidget {
  const TruckMachineRegister({Key? key}) : super(key: key);

  @override
  State<TruckMachineRegister> createState() => _TruckMachineRegisterState();
}

class _TruckMachineRegisterState extends State<TruckMachineRegister> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterConductorPage()),
                      );
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          color: Color(0xFF005b71),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(75),
                              bottomRight: Radius.circular(75)),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: 30.w,
                                  right: 30.w,
                                  top: 30.h,
                                  bottom: 30.h,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  /*borderRadius:
                              BorderRadius.only(bottomLeft: Radius.circular(100)),*/
                                ),
                                child: Image.asset(
                                  "images/Van.png",
                                  height: 140.h,
                                  width: 140.w,
                                ),
                              ),
                              Text("Van Driver",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        )),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height / 2,
                      color: Colors.white,
                      /* decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF005b71),
                              Color(0xFFFFFFFF),
                            ]),
                        color: Colors.white,
                        /* borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                        ),*/
                      ),*/
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 30.w,
                                right: 30.w,
                                top: 30.h,
                                bottom: 30.h,
                              ),
                              margin: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                                top: 20.h,
                                bottom: 20.h,
                              ),
                              decoration: BoxDecoration(
                                /*color: Color(0xFF005b71),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF005b71),
                                      Color(0xFFFFFFFF),
                                    ]),*/
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                "images/bull.png",
                                height: 140.h,
                                width: 140.w,
                              ),
                            ),
                            Text("Construction machine Driver",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xFF005b71),
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
