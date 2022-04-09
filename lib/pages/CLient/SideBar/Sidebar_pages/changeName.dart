import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iblaze/data/globals.dart';
import 'package:iblaze/pages/CLient/SideBar/Sidebar_pages/user_profile.dart';

import '../../../../Widgets/button_widget.dart';
import '../../../../services/userServices/Register_Login.dart';


class ChangeName extends StatefulWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  State<ChangeName> createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  @override
  void initState() {
    super.initState();

    usernameController = TextEditingController();
  }

  String? validateUsername(String value) {
    if (!GetUtils.isUsername(value)) {
      return "Provide a valid Username";
    }
    return null;
  }

  bool isvisible = false;
  var userName;
  var LastuserName;
  Image pic = Image.asset(
    "images/Lg.png",
    height: 100,
    width: 100,
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
          Form(
            key: loginFormKey,
            child: Container(
              child: TextFormField(
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
                  NewName = text;
                  isvisible = true;
                },
                controller: usernameController,
                onSaved: (value) {
                  userName = value!;
                },
                validator: (value) {
                  return validateUsername(value!);
                },
              ),
            ),
          ),
          SizedBox(height: 100),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ButtonWidget(
                  text: "Save",
                  onClicked: () async {
                    await APIServiceUser.Update(currentUser?.username, NewName);
                    var x = checkLogin();
                    if (checkUpdate) {
                      Get.off(() => User());
                    } else if (x && checkUpdate == false) {
                      Get.defaultDialog(
                          title: "Error",
                          titleStyle: TextStyle(fontSize: 30),
                          middleText: "Username is taken",
                          middleTextStyle: TextStyle(
                              color: Color(0xFF005b71), fontSize: 20));
                    }
                    ;
                  }),
            ),
          ),
        ],
      )),
    );
  }

  bool checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    } else {
      loginFormKey.currentState!.save();
      return true;
    }
  }
}
