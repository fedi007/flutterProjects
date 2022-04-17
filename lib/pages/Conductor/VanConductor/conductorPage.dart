import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iblaze/data/globals.dart';
import 'package:iblaze/pages/CLient/Login_page.dart';
import 'package:iblaze/pages/Conductor/VanConductor/RegisteredOffers.dart';
import 'package:iblaze/pages/Conductor/VanConductor/HomePage.dart';

import '../../../Models/truck.dart';
import '../../../services/conductorServices/truckAPI.dart';
import '../AcceptedOffers.dart';
import 'SideBar/NavigationDrawerConductor.dart';

class VanConductor extends StatefulWidget {
  const VanConductor({Key? key}) : super(key: key);

  @override
  State<VanConductor> createState() => _VanConductorState();
}

class _VanConductorState extends State<VanConductor> {
  int index = 0;

  final screens = [HomePage(), conductorRegisteredOffers(), AcceptedOffers()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => SafeArea(
        child: Scaffold(
          body: screens[index],
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              height: 45.h,
              indicatorColor: Colors.transparent,
              labelTextStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 9.h.w,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
            ),
            child: NavigationBar(
                backgroundColor: Color(0xFF005b71),
                selectedIndex: index,
                //animationDuration: Duration(seconds: 2),
                onDestinationSelected: (index) =>
                    setState(() => this.index = index),
                destinations: [
                  NavigationDestination(
                    icon: Icon(Icons.home, color: Colors.white, size: 20.h.w),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.email, color: Colors.white, size: 20.h.w),
                    label: 'Submitted offers',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.check, color: Colors.white, size: 20.h.w),
                    label: 'Accepted offers',
                  )
                ]),
          ),
          drawer: const NavigationDrawerConduct(),
          appBar: AppBar(
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                      child: Text(
                        "Logout",
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        userData.remove("password");
                        userData.remove("username");

                        WidgetsBinding.instance!.addPostFrameCallback(
                          (_) {
                            Get.offAll(LoginPage());
                          },
                        );
                      })
                ],
              )
            ],
            backgroundColor: Color(0xFF005b71),
          ),
        ),
      ),
    );
  }
}
