import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iblaze/data/globals.dart';
// import 'changeName.dart';

class ConductorProfile extends StatefulWidget {
  const ConductorProfile({Key? key}) : super(key: key);

  @override
  State<ConductorProfile> createState() => _ConductorProfileState();
}

class _ConductorProfileState extends State<ConductorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Color(0xFF005b71),
      ),
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 80),
                Image.asset(
                  "images/Lg.png",
                  height: 120,
                  width: 120,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text("${currentConductor?.conductorName}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GestureDetector(
                            onTap: () {},
                            child:
                                Icon(Icons.edit, color: Colors.grey, size: 20)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 5),
                  child: Text("${currentConductor?.condcutorEmail}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.grey)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30, top: 5),
                      child: Text("${currentConductor?.TruckModel} :",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: Text("${currentConductor?.TruckLicensePlate}  ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                    ),
                  ],
                ),
                SizedBox(height: 220),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Account Created On : ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 124, 124),
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                      Text("${currentConductor?.creationDate}",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 20)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
