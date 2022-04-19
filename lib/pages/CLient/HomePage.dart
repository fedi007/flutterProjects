import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Widgets/button_widget.dart';
import '../../data/globals.dart';
import '../../services/userServices/Offre_Api.dart';
import 'TruckMachine_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController location = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController arrival = TextEditingController();
  TextEditingController other = TextEditingController();

  TimeOfDay? Time = TimeOfDay.now();
  DateTime? Date = DateTime.now();
  String? dropdownvalue;
  bool isVisible = false;
  String? depart;
  String? arrivee;
  String? response;
  String? deliveryTime;
  String? deliveryDay;
  String? freightType;
  String? quantity;
  @override
  void initState() {
    super.initState();

    setState(() {
      response = "Only Delivering";
      deliveryTime = "${Time!.hour.toString()}:${Time!.minute.toString()}";
      deliveryDay =
          "${Date!.day.toString()}-${Date!.month.toString()}-${Date!.year.toString()}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => TruckMachine());
        return true;
      },
      child: Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Color(0xFF005b71), width: 2)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        hint: Center(
                          child: Text(
                            "Choose your freight type",
                            style: TextStyle(
                              color: Color(0xFF005b71),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(20),
                        value: dropdownvalue,
                        icon: Icon(Icons.keyboard_arrow_down,
                            color: Color(0xFF005b71), size: 30),
                        items: dropDownBtnItem.map((
                          String items,
                        ) {
                          return DropdownMenuItem(
                              value: items,
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  items,
                                  style: TextStyle(
                                    color: Color(0xFF005b71),
                                    fontSize: 17.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ));
                        }).toList(),
                        onTap: () {},
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue;
                            freightType = newValue;
                            if (dropdownvalue == dropDownBtnItem.last) {
                              isVisible = true;
                              freightType = null;
                            } else {
                              isVisible = false;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    width: double.infinity,
                    child: TextField(
                      controller: other,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 3, color: Color(0xFF005b71)),
                          ),
                          hintText: 'Specify Your freight type ',
                          hintStyle: TextStyle(
                              //   fontSize: 20,
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF005b71),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onChanged: (value) {
                        freightType = value;
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  child: TextField(
                    controller: weight,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(width: 3, color: Color(0xFF005b71)),
                        ),
                        hintText: 'Weight / Quantity',
                        hintStyle: TextStyle(
                            //   fontSize: 20,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF005b71),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onChanged: (value) {
                      quantity = value;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  child: TextField(
                    controller: location,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () async {
                            Position position = await _getGeoLocationPosition();

                            await GetAddressFromLatLong(position);
                            if (depart != null) {
                              location.text = "${depart}";
                            }
                          },
                          icon: Icon(FontAwesomeIcons.locationDot,
                              color: Color(0xFF005b71)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(width: 3, color: Color(0xFF005b71)),
                        ),
                        hintText: '           Departure Location',
                        hintStyle: TextStyle(
                            //   fontSize: 20,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF005b71),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onChanged: (value) {
                      depart = value;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: double.infinity,
                  child: TextField(
                    controller: arrival,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(width: 3, color: Color(0xFF005b71)),
                        ),
                        hintText: 'Arrival Location ',
                        hintStyle: TextStyle(
                            //   fontSize: 20,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF005b71),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onChanged: (value) {
                      arrivee = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(" Delivery Time :",
                          style: GoogleFonts.roboto(
                              fontSize: 17,
                              // fontWeight: FontWeight.bold,
                              color: Color(0xFF005b71))),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 5),
                        child: Text(
                          "${Time!.hour.toString()}:${Time!.minute.toString()}",
                          style: GoogleFonts.roboto(
                            fontSize: 17,
                            //  fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () async {
                            TimeOfDay? newTime = await showTimePicker(
                                context: context, initialTime: Time!);
                            if (newTime != null) {
                              setState(() {
                                Time = newTime;
                                deliveryTime =
                                    "${Time!.hour.toString()}:${Time!.minute.toString()}";
                              });
                            }
                          },
                          child:
                              Icon(Icons.edit, color: Colors.grey, size: 17)),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 5),
                        child: Text(
                          "${Date!.day.toString()}-${Date!.month.toString()}-${Date!.year.toString()}",
                          style: GoogleFonts.roboto(fontSize: 17
                              //  fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: Date!,
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2023));
                            if (newDate != null) {
                              setState(() {
                                Date = newDate;
                                deliveryDay =
                                    "${Date!.day.toString()}-${Date!.month.toString()}-${Date!.year.toString()}";
                              });
                            }
                          },
                          child:
                              Icon(Icons.edit, color: Colors.grey, size: 17)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Delivering And Unloading",
                          style:
                              TextStyle(color: Color(0xFF005b71), fontSize: 15
                                  //fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xFF005b71)),
                            value: "Delivering And Unloading",
                            groupValue: response,
                            onChanged: (String? val) {
                              setState(() {
                                response = val;
                              });
                            }),
                        Text(
                          "Only Delivering",
                          style:
                              TextStyle(color: Color(0xFF005b71), fontSize: 15
                                  // fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xFF005b71)),
                            value: "Only Delivering",
                            groupValue: response,
                            onChanged: (String? val) {
                              setState(() {
                                response = val;
                              });
                            })
                      ]),
                ),
                SizedBox(height: 20),
                ButtonWidget(
                    text: "Look For Offers",
                    onClicked: () async {
                      if (freightType == null ||
                          quantity == null ||
                          depart == null ||
                          arrivee == null) {
                        Get.defaultDialog(
                            title: "Error",
                            titleStyle: TextStyle(
                                fontSize: 30,
                                color: Color(0xFFE40613),
                                fontWeight: FontWeight.bold),
                            middleText: "Check your offer",
                            middleTextStyle: TextStyle(
                                color: Color(0xFF005b71), fontSize: 20));
                      } else {
                        Get.defaultDialog(
                            title: "Check",
                            titleStyle: TextStyle(
                                fontSize: 30, color: Color(0xFF005b71)),
                            middleText:
                                "Freight Type : ${freightType} \n \n Quantity/Weight : ${quantity}  \n \n Departure Location : ${depart} \n \n Arrival Location : ${arrivee} \n \n  ${deliveryTime} , ${deliveryDay}  \n \n  ${response}  \n \n   ",
                            textCancel: "Cancel",
                            cancelTextColor: Color(0xFF005b71),
                            textConfirm: "Confirm",
                            confirmTextColor: Colors.white,
                            buttonColor: Color(0xFF005b71),
                            onConfirm: () async {
                              await APIOffreUser.RegisterOffre(
                                  depart,
                                  arrivee,
                                  response,
                                  deliveryTime,
                                  deliveryDay,
                                  freightType,
                                  quantity,
                                  currentUser?.id);

                              if (offreCheck) {
                                location.clear();
                                other.clear();
                                arrival.clear();
                                weight.clear();
                                Get.back();
                                Get.defaultDialog(
                                    title: "Success",
                                    titleStyle: TextStyle(
                                        fontSize: 25, color: Colors.green),
                                    middleText: "Your offer has been posted",
                                    middleTextStyle: TextStyle(
                                        color: Color(0xFF005b71),
                                        fontSize: 20));
                              } else {
                                Get.back();
                                Get.defaultDialog(
                                    title: "Error",
                                    titleStyle: TextStyle(
                                        fontSize: 30,
                                        color: Color(0xFFE40613),
                                        fontWeight: FontWeight.bold),
                                    middleText: "Check your offer",
                                    middleTextStyle: TextStyle(
                                        color: Color(0xFF005b71),
                                        fontSize: 20));
                              }
                            });
                      }
                    })
              ],
            ),
          ),
        )),
      ),
    );
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    depart =
        '${place.street} ${place.subLocality} ${place.locality} ${place.postalCode} ${place.country}';
    setState(() {});
  }
}
