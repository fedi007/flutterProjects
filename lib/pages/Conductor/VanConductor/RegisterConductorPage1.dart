import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Widgets/button_widget.dart';
import '../../../services/conductorServices/Register_Login_Conductor.dart';
import 'RegisterConductorPage2.dart';

class RegisterConductorPage extends StatefulWidget {
  const RegisterConductorPage({Key? key}) : super(key: key);

  @override
  State<RegisterConductorPage> createState() => _RegisterConductorPageState();
}

class _RegisterConductorPageState extends State<RegisterConductorPage> {
  String TruckLicense = "";
  String TruckModel = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              //autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Container(
                            child: Text("REGISTER",
                                style: GoogleFonts.roboto(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff007097))))),
                    SizedBox(height: 50),
                    TextFormField(
                      cursorColor: Color(0xFF005b71),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFF005b71)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // filled: true,
                        // fillColor: Color.fromARGB(255, 243, 243, 243),
                        labelText: "Truck Model",
                        labelStyle:
                            GoogleFonts.roboto(color: Color(0xff007097)),

                        prefixIcon: Icon(
                          FontAwesomeIcons.truck,
                          color: Color(0xFF005b71),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        TruckModel = value;
                        ;
                      },
                    ),
                    SizedBox(height: 15),
                    TextField(
                      cursorColor: Color(0xFF005b71),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFF005b71)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),

                        // filled: true,
                        // fillColor: Color.fromARGB(255, 243, 243, 243),
                        labelText: "Truck License Plate",
                        labelStyle:
                            GoogleFonts.roboto(color: Color(0xff007097)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        TruckLicense = value;
                        ;
                      },
                    ),
                    SizedBox(height: 50),
                    ButtonWidget(
                        text: "Next",
                        onClicked: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegisterConductorSecondPage(
                                    TruckModel: TruckModel,
                                    LicensePlate: TruckLicense,
                                  )));
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
