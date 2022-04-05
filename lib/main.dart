import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:iblaze/pages/CLient/ClientPage.dart';
import 'package:iblaze/pages/CLient/TruckMachine_page.dart';
import 'package:iblaze/pages/Conductor/RegisterAs.dart';
import 'package:iblaze/pages/Conductor/VanConductorRegister/RegisterConductorPage1.dart';

import 'package:iblaze/pages/Splash_screen.dart';
import 'package:iblaze/testing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fade,

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(title: 'Flutter'),
      // home: test(),
      // home: RegisterConductorPage()
    );
  }
}
