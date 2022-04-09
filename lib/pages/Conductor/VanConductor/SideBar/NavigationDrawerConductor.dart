import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iblaze/data/globals.dart';
import 'package:iblaze/pages/CLient/SideBar/Sidebar_pages/user_profile.dart';
import 'package:iblaze/pages/Conductor/VanConductor/SideBar/drawer_items.dart';
import 'package:iblaze/pages/Conductor/VanConductor/sideBar_pages/ConductorProfile.dart';
import 'package:iblaze/pages/Conductor/VanConductor/sideBar_pages/RentHistory.dart';
import 'package:iblaze/pages/Conductor/VanConductor/sideBar_pages/about.dart';
import 'package:iblaze/pages/Conductor/VanConductor/sideBar_pages/support.dart';

class NavigationDrawerConduct extends StatelessWidget {
  const NavigationDrawerConduct({Key? key}) : super(key: key);

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
                  onClicked: () => onItemPressed(context, index: 3),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Divider(
                  thickness: 2,
                  height: 10,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 40,
                ),
                DrawerItem(
                    name: 'Rent history',
                    icon: Icons.lock_clock,
                    onPressed: () => onItemPressed(context, index: 1)),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'Support',
                    icon: FontAwesomeIcons.user,
                    onPressed: () => onItemPressed(context, index: 2)),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'About',
                    icon: FontAwesomeIcons.exclamation,
                    onPressed: () => onItemPressed(context, index: 3)),
                SizedBox(
                  height: 100,
                ),
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
        Get.to(() => RentHistory());
        break;
      case 1:
        Get.to(() => Support());
        break;
      case 2:
        Get.to(() => About());
        break;
      case 3:
        Get.to(() => ConductorProfile());
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
              Text('${currentConductor?.conductorName}',
                  style: GoogleFonts.roboto(
                      fontSize: 25,
                      color: Color(0xFF007097),
                      fontWeight: FontWeight.bold)),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Text(Email,
              //     style: TextStyle(fontSize: 20, color: Color(0xFF005b71)))
            ],
          ));
}
