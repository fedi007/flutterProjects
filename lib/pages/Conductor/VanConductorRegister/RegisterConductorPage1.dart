import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Widgets/button_widget.dart';
import '../../../services/conductorServices/Register_Login.dart';
import '../ConductorPages/cond.dart';

class RegisterConductorPage extends StatefulWidget {
  const RegisterConductorPage({Key? key}) : super(key: key);

  @override
  State<RegisterConductorPage> createState() => _RegisterConductorPageState();
}

class _RegisterConductorPageState extends State<RegisterConductorPage> {
  bool passwordObscured = true;
  var conductorPassword;
  var conductorEmail;
  var conductorName;
  var TruckLicense;
  var TruckModel;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SafeArea(
                child: Scaffold(
                  resizeToAvoidBottomInset: true,
                  body: SingleChildScrollView(
                      child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 20.h),
                          Container(
                            height: 150.h,
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 50.h),
                                  child: Image.asset(
                                    "images/Lg.png",
                                    height: 100.h,
                                    width: 100.w,
                                  ),
                                ),
                              ],
                            )),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 70.h),
                            padding: EdgeInsets.only(left: 20.w, right: 20.r),
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 50,
                                    color: Color(0xffEEEEEE)),
                              ],
                            ),
                            child: TextField(
                              cursorColor: Color(0xFF005b71),
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Color(0xFF005b71),
                                ),
                                hintText: "Username",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (value) {
                                conductorName = value;
                              },
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 20.h),
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 50,
                                    color: Color(0xffEEEEEE)),
                              ],
                            ),
                            child: TextField(
                              cursorColor: Color(0xFF005b71),
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.email,
                                  color: Color(0xFF005b71),
                                ),
                                hintText: "Email",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (value) {
                                conductorEmail = value;
                              },
                            ),
                          ),
                          Positioned(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: 20.w, right: 20.w, top: 20.h),
                              padding: EdgeInsets.only(left: 20.w, right: 20.w),
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xffEEEEEE),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 20),
                                      blurRadius: 100,
                                      color: Color(0xffEEEEEE)),
                                ],
                              ),
                              child: TextField(
                                cursorColor: Color(0xFF005b71),
                                decoration: InputDecoration(
                                  focusColor: Color(0xFF005b71),
                                  icon: Icon(
                                    Icons.vpn_key,
                                    color: Color(0xFF005b71),
                                  ),
                                  hintText: " Password",
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        passwordObscured = !passwordObscured;
                                      });
                                    },
                                    icon: Icon(passwordObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                                obscureText: passwordObscured,
                                onChanged: (value) {
                                  conductorPassword = value;
                                },
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 20.h),
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 50,
                                    color: Color(0xffEEEEEE)),
                              ],
                            ),
                            child: TextField(
                              cursorColor: Color(0xFF005b71),
                              decoration: InputDecoration(
                                icon: Icon(
                                  FontAwesomeIcons.truck,
                                  color: Color(0xFF005b71),
                                ),
                                hintText: "Truck Model",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (value) {
                                TruckModel = value;
                              },
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: 20.h),
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 50,
                                    color: Color(0xffEEEEEE)),
                              ],
                            ),
                            child: TextField(
                              cursorColor: Color(0xFF005b71),
                              decoration: InputDecoration(
                                icon: Image.asset(
                                  "images/plate.png",
                                  color: Color(0xFF005b71),
                                ),
                                hintText: "Truck License",
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              onChanged: (value) {
                                TruckLicense = value;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 50.h),
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            height: 40.h,
                            width: 600.h,
                            child: ButtonWidget(
                                text: "REGISTER",
                                onClicked: () async {
                                  await APIService.RegisterConductor(
                                    conductorName,
                                    conductorEmail,
                                    conductorPassword,
                                    TruckModel,
                                    TruckLicense,
                                  );
                                  if (check) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Conduct()));
                                  }
                                }),
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              ),
            ));
  }
}
