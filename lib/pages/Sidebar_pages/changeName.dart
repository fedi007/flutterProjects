import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iblaze/pages/Sidebar_pages/user_profile.dart';

import '../../Widgets/button_widget.dart';
import '../../services/userServices/register_login.dart';

class ChangeName extends StatefulWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  State<ChangeName> createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  bool isvisible = false;
  var userName;
  var LastuserName;
  Image pic = Image.asset(
    "images/Lg.png",
    height: 100.h,
    width: 100.w,
  );

  String? NewName;
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
            //visible: isvisible,
            child: Container(
              margin: EdgeInsets.only(top: 50.h),
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              height: 40.h,
              width: 600.h,
              child: ButtonWidget(
                  text: "Save",
                  onClicked: () async {
                    await APIService.Update(Name, NewName);

                    if (test) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserProfile(
                                name: Name,
                                email: Email,
                                picture: pic,
                                Date: creationDate),
                          ));
                    } else if (NewName == null) {
                      Fluttertoast.showToast(
                        msg: "Invalid Username",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16,
                      );
                    } else {
                      Fluttertoast.showToast(
                        msg: "Invalid Username",
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
          ),
        ],
      )),
    );
  }
}
