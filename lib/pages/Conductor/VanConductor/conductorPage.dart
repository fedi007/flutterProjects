import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iblaze/pages/Conductor/VanConductor/AcceptedOffers.dart';
import 'package:iblaze/pages/Conductor/VanConductor/HomePage.dart';

import 'SideBar/NavigationDrawerConductor.dart';

class VanConductor extends StatefulWidget {
  const VanConductor({Key? key}) : super(key: key);

  @override
  State<VanConductor> createState() => _VanConductorState();
}

class _VanConductorState extends State<VanConductor> {
  int index = 0;
  final screens = [HomePage(), AcceptedOffers()];

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
                backgroundColor: Color(0xFF007097),
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
                    // onTap: () {
                    //   userData.remove("password");
                    //   userData.remove("username");

                    //   WidgetsBinding.instance!.addPostFrameCallback(
                    //     (_) {
                    //       Get.offAll(LoginPage());
                    //     },
                    //   );
                    // }
                  )
                ],
              )
            ],
            backgroundColor: Color(0xFF007097),
          ),
        ),
      ),
    );
  }
}
