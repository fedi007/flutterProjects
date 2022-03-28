import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iblaze/pages/Sidebar_pages/user_profile.dart';

import '../../Widgets/button_widget.dart';
import '../../services/Api_services.dart';

class ChangeName extends StatefulWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  State<ChangeName> createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  bool isvisible = false;

  var NewName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: TextField(
                cursorColor: Color(0xFF005b71),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xFF005b71),
                  ),
                  hintText: "Write your new username",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: (text) {
                  setState(() {
                    NewName = text;
                    isvisible = true;
                  });
                }),
          ),
          Visibility(
            visible: isvisible,
            child: Container(
              margin: EdgeInsets.only(top: 50.h),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              height: 40.h,
              width: 600.h,
              child: ButtonWidget(
                  text: "REGISTER",
                  onClicked: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => User(
                            name: Name,
                            email: Email,
                            picture: Image.asset(
                              "images/Lg.png",
                              height: 100.h,
                              width: 100.w,
                            ),
                          ),
                        ));
                  }),
            ),
          ),
        ],
      )),
    );
  }
}
