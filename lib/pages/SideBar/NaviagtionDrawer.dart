import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/userServices/register_login.dart';

import '../Conductor/RegisterAs.dart';
import '../Sidebar_pages/RentHistory.dart';
import '../Sidebar_pages/about.dart';
import '../Sidebar_pages/promotions.dart';
import '../Sidebar_pages/support.dart';
import '../Sidebar_pages/user_profile.dart';
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
                  onClicked: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserProfile(
                          name: Name,
                          email: Email,
                          picture: Image.asset(
                            "images/Lg.png",
                            height: 100,
                            width: 100,
                          ),
                          Date: creationDate),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Divider(
                  thickness: 1,
                  height: 10,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 40,
                ),
                DrawerItem(
                  name: 'Promotion',
                  icon: FontAwesomeIcons.tag,
                  onPressed: () => onItemPressed(context, index: 0),
                ),
                const SizedBox(
                  height: 30,
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BecomeDriver(
                    onClicked: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => TruckMachineRegister())),
                  ),
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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Promotion()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RentHistory()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Support()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const About()));
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
              Text(Name,
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
              width: 120.w,
              child: Center(
                  child: Text("Become a driver",
                      style:
                          TextStyle(fontSize: 15, color: Color(0xFF005b71)))),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFF005b71),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF005b71).withOpacity(0.1),
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
