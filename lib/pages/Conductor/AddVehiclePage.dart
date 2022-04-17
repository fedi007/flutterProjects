import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iblaze/data/globals.dart';
import 'package:iblaze/pages/Conductor/VanConductor/VehicleManagement.dart';
import '../../../Widgets/button_widget.dart';
import '../../services/conductorServices/truckAPI.dart';
import 'VanConductor/conductorPage.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({Key? key}) : super(key: key);

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  String TruckLicense = "";
  String TruckModel = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(() => VanConductor());
        return true;
      },
      child: SafeArea(
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
                              child: Text("Add Vehicle",
                                  style: GoogleFonts.roboto(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff007097))))),
                      SizedBox(height: 50),
                      SizedBox(height: 15),
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
                            Row(children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text("Truck's photo",
                                    style: GoogleFonts.roboto(
                                        fontSize: 22, color: Colors.grey)),
                              ),
                              SizedBox(width: 120),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text("Required *",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16, color: Colors.red)),
                              ),
                            ]),
                            SizedBox(height: 27),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 39,
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
                      SizedBox(height: 30),
                      TextFormField(
                        cursorColor: Color(0xFF005b71),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1.5, color: Color(0xFF005b71)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 1.5, color: Color(0xFF005b71)),
                          ),
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1.5, color: Color(0xFF005b71)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 1.5, color: Color(0xFF005b71)),
                          ),
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
                      SizedBox(height: 30),
                      ButtonWidget(
                          text: "Add vehicle",
                          onClicked: () async {
                            print(TruckModel);
                            print(TruckLicense);
                            await APITruckServices.RegisterTruck(
                                TruckModel, TruckLicense);

                            if (truckRegisterCheck) {
                              await APITruckServices.AddTruck(
                                  currentTruck?.TruckId,
                                  currentConductor?.conductorId);
                              if (truckAddCheck) {
                                Fluttertoast.showToast(
                                    msg: "Truck has been added successfully",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 20.0);
                                Get.off(() => VehicleManagement());
                              } else {
                                Get.defaultDialog(
                                    title: "!",
                                    titleStyle: TextStyle(
                                        fontSize: 30,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                    middleText: "Truck can not be added ",
                                    middleTextStyle: TextStyle(
                                        color: Color(0xFF005b71),
                                        fontSize: 20));
                              }
                            } else {
                              Get.defaultDialog(
                                  title: "!",
                                  titleStyle: TextStyle(
                                      fontSize: 30,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                  middleText: "Truck can not be added ",
                                  middleTextStyle: TextStyle(fontSize: 20));
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
