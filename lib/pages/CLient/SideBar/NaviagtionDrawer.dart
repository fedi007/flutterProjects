import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iblaze/data/globals.dart';
import 'package:iblaze/pages/CLient/SideBar/Sidebar_pages/user_profile.dart';
import '../../Conductor/VanConductor/RegisterConductorPage1.dart';
import 'Sidebar_pages/RentHistory.dart';
import 'Sidebar_pages/about.dart';
import 'Sidebar_pages/promotions.dart';
import 'Sidebar_pages/support.dart';
import 'drawer_items.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => Drawer(
        child: Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),
            child: Column(
              children: [
                headerWidget(
                  onClicked: () => onItemPressed(context, index: 4),
                ),
                SizedBox(
                  height: 40,
                ),
                Divider(
                  thickness: 2,
                  //height: 10,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 40,
                ),
                DrawerItem(
                  name: 'Promotion',
                  icon: FontAwesomeIcons.tag,
                  onPressed: () => onItemPressed(context, index: 0),
                ),
                SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'Rent history',
                    icon: Icons.lock_clock,
                    onPressed: () => onItemPressed(context, index: 1)),
                SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'Support',
                    icon: FontAwesomeIcons.user,
                    onPressed: () => onItemPressed(context, index: 2)),
                SizedBox(
                  height: 30.h,
                ),
                DrawerItem(
                    name: 'About',
                    icon: FontAwesomeIcons.exclamation,
                    onPressed: () => onItemPressed(context, index: 3)),
                SizedBox(
                  height: 100.h,
                ),
                BecomeDriver(
                  onClicked: () => onItemPressed(context, index: 5),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Get.to(() => Promotion());
        break;
      case 1:
        Get.to(() => RentHistory());
        break;
      case 2:
        Get.to(() => Support());
        break;
      case 3:
        Get.to(() => About());
        break;
      case 4:
        Get.to(() => User());
        break;
      case 5:
        Get.to(() => RegisterConductorPage());
        break;
    }
  }

  Widget headerWidget({
    required VoidCallback onClicked,
  }) =>
      InkWell(
          hoverColor: Colors.transparent,
          onTap: onClicked,
          child: Column(
            children: [
              Text('${currentUser?.username}',
                  style: GoogleFonts.roboto(
                      fontSize: 25,
                      color: Color(0xFF005b71),
                      fontWeight: FontWeight.bold)),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Text(Email,
              //     style: TextStyle(fontSize: 20, color: Color(0xFF005b71)))
            ],
          ));

  Widget BecomeDriver({
    required VoidCallback onClicked,
  }) =>
      InkWell(
        hoverColor: Colors.transparent,
        onTap: onClicked,
        child: Column(
          children: [
            Container(
              height: 60.h,
              width: 200.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Become a driver  ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF005b71),
                      )),
                  SizedBox(height: 10),
                  Text(" earn money on your schedule ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF005b71),
                      )),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(62, 0, 90, 113),
                      Color.fromARGB(62, 255, 255, 255),
                    ]),
                border: Border.all(
                  color: Color(0xFF005b71),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
