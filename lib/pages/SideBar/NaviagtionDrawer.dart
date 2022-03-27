import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Conductor/RegisterAs.dart';
import '../../Conductor/VanConductorRegister/RegisterConductorPage1.dart';
import '../../services/Api_services.dart';
import '../Login_page.dart';
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
          color: Color(0xFF005b71),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 80, 24, 0),
            child: Column(
              children: [
                headerWidget(
                  onClicked: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => User(
                        name: Name,
                        email: Email,
                        /*pic: Image.asset(
                          "images/Lg.png",
                          height: 100.h,
                          width: 100.w,
                        ),*/
                      ),
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
                    icon: FontAwesomeIcons.tag,
                    onPressed: () => onItemPressed(context, index: 2)),
                const SizedBox(
                  height: 30,
                ),
                DrawerItem(
                    name: 'About',
                    icon: FontAwesomeIcons.heart,
                    onPressed: () => onItemPressed(context, index: 3)),
                SizedBox(
                  height: 50.h,
                ),
                BecomeDriver(
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TruckMachineRegister())),
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
        child: Row(
          children: [
            Container(
              child: Image.asset(
                "images/Lg.png",
                height: 40.h,
                width: 40.w,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Name, style: TextStyle(fontSize: 14, color: Colors.white)),
                SizedBox(
                  height: 10.h,
                ),
                Text(Email, style: TextStyle(fontSize: 14, color: Colors.white))
              ],
            )
          ],
        ),
      );

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
                      style: TextStyle(fontSize: 15, color: Colors.white))),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF005b71),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
