import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'SideBar/NaviagtionDrawer.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  String? dropdownvalue;
  String? Response;

  bool isVisible = false;
  var items = ['Type1', 'Type2', 'Type3', 'Type4', 'Type5', 'Other '];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => SafeArea(
        child: Scaffold(
            drawer: const NavigationDrawer(),
            appBar: AppBar(
              backgroundColor: Color(0xFF005b71),
            ),
            body: Builder(builder: (context) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //color: Color(0xFF005b71),
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        hint: Container(
                          width: double.infinity,
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
                        items: items.map((
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
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue;
                            if (dropdownvalue == items.last) {
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
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
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
                      ),
                    ),
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
                            ),
                          ),
                          Radio(
                              value: "yes",
                              groupValue: Response,
                              onChanged: (String? val) {
                                setState(() {
                                  Response = val;
                                });
                              }),
                          Text(
                            "Only Delivering ",
                            style: TextStyle(
                              color: Color(0xFF005b71),
                            ),
                          ),
                          Radio(
                              value: "NO",
                              groupValue: Response,
                              onChanged: (String? val) {
                                setState(() {
                                  Response = val;
                                });
                              })
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 70.h),
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    height: 40.h,
                    width: 600.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Look for offers",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFF005b71),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      ),
                    ),
                  )
                ],
              ));
            })),
      ),
    );
  }
}
