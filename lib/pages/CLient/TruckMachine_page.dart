import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/userServices/Offre_Api.dart';
import '../../services/userServices/register_login.dart';
import 'ClientPage.dart';

class TruckMachine extends StatefulWidget {
  const TruckMachine({Key? key}) : super(key: key);

  @override
  State<TruckMachine> createState() => _TruckMachineState();
}

class _TruckMachineState extends State<TruckMachine> {
  DateTime timeBackPressed = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => APIOffre.getOffers(Name));
    dropDownBtnItem.add("other");
  }

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => WillPopScope(
        onWillPop: () async {
          final difference = DateTime.now().difference(timeBackPressed);
          final isExitWarning = difference >= Duration(seconds: 2);
          timeBackPressed = DateTime.now();

          if (isExitWarning) {
            final message = 'Press back again to exit';
            Fluttertoast.showToast(msg: message, fontSize: 18);
            return false;
          } else {
            Fluttertoast.cancel();
            return true;
          }
        },
        child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ClientPage()),
                        );
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(
                            color: Color(0xFF005b71),
                            /* gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [
                                  Color(0xFF005b71),
                                  Color(0xFFFFFFFF),
                                ]),*/
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
                                  /* margin: EdgeInsets.only(
                                    left: 20.w,
                                    right: 20.w,
                                    top: 20.h, 
                                    bottom: 20.h,
                                  ),*/
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    /*borderRadius:
                                BorderRadius.only(bottomLeft: Radius.circular(100)),*/
                                  ),
                                  child: Image.asset(
                                    "images/Van.png",
                                    height: 200,
                                    width: 200,
                                  ),
                                ),
                                Text("Removal Van",
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
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                              Text("Construction Machine",
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
      ),
    );
  }
}
