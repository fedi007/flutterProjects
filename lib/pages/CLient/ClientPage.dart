import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iblaze/pages/Login_page.dart';

import '../SideBar/NaviagtionDrawer.dart';
import 'HomePage.dart';
import 'offers.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  int index = 0;
 // final userData = GetStorage();
  final screens = [HomePage(), Offers()];

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
                  fontSize: 13,
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
                    icon: Icon(Icons.home, color: Colors.white, size: 25),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.email, color: Colors.white, size: 25),
                    label: 'Your offers',
                  )
                ]),
          ),
          drawer: const NavigationDrawer(),
          appBar: AppBar(
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                      child: Text(
                        "Logout",
                        style: TextStyle(color: Color(0xFF005b71)),
                      ),
                      //onTap: () {
                        // userData.write("isLogged", false);
                        // userData.remove("username");

                        // WidgetsBinding.instance!.addPostFrameCallback(
                        //   (_) {
                        //     Get.offAll(LoginPage());
                         // },
                       // );
                     // }
                      )
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
