
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Widgets/button_widget.dart';
import '../../services/userServices/Register_Login.dart';
import '../../services/userServices/Offre_Api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? dropdownvalue;
  int index = 0;
  bool isVisible = false;
  String? depart;
  String? arrivee;
  String? response;
  String? deliveryTime;
  String? freightType;
  String? quantity;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
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
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                width: double.infinity,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Specify Your freight type ',
                      hintStyle: TextStyle(
                          //   fontSize: 20,
                          ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF005b71),
                        ),
                      )),
                  onChanged: (value) {
                    freightType = value;
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              width: double.infinity,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: 'Weight(ex : 10kg ) / Quantity (ex :10 ) ',
                    hintStyle: TextStyle(
                        //   fontSize: 20,
                        ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF005b71),
                      ),
                    )),
                onChanged: (value) {
                  quantity = value;
                },
              ),
            ),
            Row(
              children: [
                Text(" From",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF005b71))),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(24.h.w),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Tunis ',
                          hintStyle: TextStyle(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF005b71),
                            ),
                          )),
                      onChanged: (value) {
                        depart = value;
                      },
                    ),
                  ),
                ),
                Text(" To",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF005b71))),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(24.h.w),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Manouba ',
                          hintStyle: TextStyle(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF005b71),
                            ),
                          )),
                      onChanged: (value) {
                        arrivee = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(" Delivery Time",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF005b71))),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0.h.w),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Specify The Time ',
                          hintStyle: TextStyle(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF005b71),
                            ),
                          )),
                      onChanged: (value) {
                        deliveryTime = value;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Delivering And Unloading",
                      style: TextStyle(
                        color: Color(0xFF005b71),
                        fontWeight: FontWeight.bold,
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
                      "Only Delivering ",
                      style: TextStyle(
                        color: Color(0xFF005b71),
                        fontWeight: FontWeight.bold,
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
            Container(
              margin: EdgeInsets.only(top: 70.h),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              height: 40.h,
              width: 600.h,
              child: ButtonWidget(
                  text: "Look For Offers",
                  onClicked: () async {
                    await APIOffre.RegisterOffre(depart, arrivee, response,
                        deliveryTime, freightType, quantity, Name);

                    if (offreCheck) {
                      Fluttertoast.showToast(
                        msg: " Your Offer Has been Posted ! ",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                      
                      //offreCheck = false;
                    } else {
                      Fluttertoast.showToast(
                        msg: " Verify Your offer ! ",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    }
                  }),
            ),
          ],
        )),
      ),
    );
  }
}
