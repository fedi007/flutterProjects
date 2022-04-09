import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iblaze/pages/CLient/offers.dart';

import '../../Widgets/button_widget.dart';
import '../../data/globals.dart';
import '../../services/userServices/register_login.dart';
import '../../services/userServices/Offre_Api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TimeOfDay? Time = const TimeOfDay(hour: 12, minute: 12);
  String? dropdownvalue;
  bool isVisible = false;
  String? depart;
  String? arrivee;
  String? response;
  String? deliveryTime = "12:12";
  String? freightType;
  String? quantity;
  @override
  void initState() {
    setState(() {
      response = "Only Delivering";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //color: Color(0xFF005b71),

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
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFF005b71),
                ),
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
                    } else {
                      isVisible = false;
                    }
                  });
                },
              ),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF005b71)),
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
                      borderRadius: BorderRadius.circular(20),
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
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1, color: Color(0xFF005b71)),
                  ),
                  hintText: 'Weight  ( ex : 10kg ) / Quantity ( ex :10 ) ',
                  hintStyle: TextStyle(
                      //   fontSize: 20,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF005b71),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(20),
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
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1, color: Color(0xFF005b71)),
                  ),
                  hintText: ' Departure Location ',
                  hintStyle: TextStyle(
                      //   fontSize: 20,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF005b71),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(20),
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
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(width: 1, color: Color(0xFF005b71)),
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
                    borderRadius: BorderRadius.circular(20),
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
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
                        color: Color(0xFF005b71))),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 5),
                  child: Text(
                    "${Time!.hour.toString()}:${Time!.minute.toString()}",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
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
                              "${Time!.hour.toString()}: ${Time!.minute.toString()}";
                        });
                      }
                    },
                    child: Icon(Icons.edit, color: Colors.grey, size: 20)),
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
                    style: TextStyle(
                      color: Color(0xFF005b71),
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  Radio(
                      value: "Delivering And Unloading",
                      groupValue: response,
                      onChanged: (String? val) {
                        setState(() {
                          response = val;
                        });
                      }),
                  Text(
                    "Only Delivering",
                    style: TextStyle(
                      color: Color(0xFF005b71),
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Radio(
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
                Get.defaultDialog(
                    title: "Check",
                    titleStyle:
                        TextStyle(fontSize: 20, color: Color(0xFF005b71)),
                    middleText:
                        "Freight Type : ${freightType} \n \n Quantity/Weight : ${quantity}  \n \n Departure Location : ${arrivee} \n \n Departure Location : ${depart} \n \n  ${deliveryTime} \n \n  ${response}  \n ",
                    textCancel: "Cancel",
                    cancelTextColor: Color(0xFF005b71),
                    textConfirm: "Confirm",
                    buttonColor: Color(0xff007097),
                    onConfirm: () async {
                      await APIOffre.RegisterOffre(depart, arrivee, response,
                          deliveryTime, freightType, quantity, currentUser?.username);
                      setState(() {
                        offre = [];
                      });

                      WidgetsBinding.instance?.addPostFrameCallback(
                          (_) => APIOffre.getOffers(currentUser?.username));

                      if (offreCheck) {
                        Get.back();
                         Get.defaultDialog(
                            title: "Success",
                            titleStyle:
                                TextStyle(fontSize: 30, color: Colors.red),
                            middleText: "Your offer has been posted",
                            middleTextStyle: TextStyle(
                                color: Color(0xFF005b71), fontSize: 20));
                      } else {
                        Get.back();
                        Get.defaultDialog(
                            title: "Error",
                            titleStyle:
                                TextStyle(fontSize: 30, color: Colors.red),
                            middleText: "Verify Your offer",
                            middleTextStyle: TextStyle(
                                color: Color(0xFF005b71), fontSize: 20));
                      }
                      ;
                    });
              })
              
        ],
      ),
    ));
  }
}
