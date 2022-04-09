import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/globals.dart';
import '../services/userServices/register_login.dart';
import '../services/userServices/Offre_Api.dart';
import 'CLient/TruckMachine_page.dart';
import 'Login_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState() {
    new Timer(const Duration(milliseconds: 3500), () {
      /* Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);*/
    });

    new Timer(Duration(milliseconds: 10), () {
      setState(() {
        _isVisible = true;
      });
    });
  }
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) => APIOffre.GetFreight());
    Future.delayed(Duration.zero, () async {
      checkIfLogged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0,
          duration: Duration(milliseconds: 1750),
          child: Center(
            child: Container(
              height: 160.0.h,
              width: 160.0.w,
              child: Center(
                child: ClipOval(
                  child:
                      Hero(tag: "blaze", child: Image.asset('images/Lg.png')),
                ),
              ),
              decoration: BoxDecoration(),
            ),
          ),
        ),
      ),
    );
  }

  void checkIfLogged() async {
    await APIService.login(
        userData.read("username"), userData.read("password"));
         print(userData.read("username"));
    print(userData.read("password"));
    print(checkLogin);
    if (checkLogin) {
      Get.to(() => TruckMachine());
    } else {
      Get.to(() => LoginPage());
    }
    ;
  }
}
