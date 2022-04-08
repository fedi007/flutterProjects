import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Widgets/button_widget.dart';
import '../ConductorPages/cond.dart';

class RegisterConductorSecondPage extends StatefulWidget {
  const RegisterConductorSecondPage({Key? key}) : super(key: key);

  @override
  State<RegisterConductorSecondPage> createState() =>
      _RegisterConductorSecondPageState();
}

class _RegisterConductorSecondPageState
    extends State<RegisterConductorSecondPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Documents",
                      style: GoogleFonts.roboto(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff007097))),
                  SizedBox(height: 50),
                  Container(
                      padding: EdgeInsets.all(25.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Color(0xFF005b71),
                            width: 1.5,
                          )),
                      child: Column(children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Driver's lisence",
                              style: GoogleFonts.roboto(
                                  fontSize: 30, color: Colors.grey)),
                        ),
                        SizedBox(height: 50),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 43,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              label: Text(
                                "Upload Image",
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 17.5),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color(0xFF005b71),
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                              ),
                              icon: Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                        )
                      ])),
                  SizedBox(height: 20),
                  Container(
                      padding: EdgeInsets.all(25.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Color(0xFF005b71),
                            width: 1.5,
                          )),
                      child: Column(children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Truck's photo",
                              style: GoogleFonts.roboto(
                                  fontSize: 30, color: Colors.grey)),
                        ),
                        SizedBox(height: 50),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 43,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              label: Text(
                                "Upload Image",
                                style: GoogleFonts.roboto(
                                    color: Colors.white, fontSize: 17.5),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color(0xFF005b71),
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                              ),
                              icon: Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                        )
                      ])),
                  SizedBox(height: 50),
                  ButtonWidget(
                      text: "Register",
                      onClicked: () {
                        Get.to(
                          () => Conduct(),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
