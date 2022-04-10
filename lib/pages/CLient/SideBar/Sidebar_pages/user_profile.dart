import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iblaze/data/globals.dart';
import 'package:iblaze/services/userServices/Register_Login.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
  }

  String? validateUsername(String value) {
    if (value.isEmpty) {
      return " Username Can't be empty ";
    }
    return null;
  }

  bool isvisible = false;
  var userName;
  var LastuserName;
  String? NewName;
  Future<void> ShowInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              child: Form(
                key: loginFormKey,
                child: TextFormField(
                  cursorColor: Color(0xFF005b71),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xFF005b71),
                    ),
                    hintText: "Write your new username",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF005b71),
                      ),
                    ),
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: (text) {
                    NewName = text;
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
            actions: <Widget>[
              TextButton(
                  child: Text("Update",
                      style: TextStyle(color: Color(0xFF005b71))),
                  onPressed: () async {
                    await APIServiceUser.Update(currentUser?.username, NewName);
                    checkLogin();
                    var x = checkLogin();
                    if (checkUpdate) {
                      Get.back();
                    } else if (x && checkUpdate == false) {
                      Get.defaultDialog(
                          title: "Error",
                          titleStyle: TextStyle(fontSize: 30),
                          middleText: "Username is taken",
                          middleTextStyle: TextStyle(
                              color: Color(0xFF005b71), fontSize: 20));
                    }
                    ;
                  })
            ],
          );
        });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        centerTitle: true,
        backgroundColor: Color(0xFF005b71),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 80),
                  Image.asset(
                    "images/Lg.png",
                    height: 120,
                    width: 120,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text("${currentUser?.username}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                              onTap: () async {
                                await ShowInformationDialog(context);
                              },
                              child: Icon(Icons.edit,
                                  color: Colors.grey, size: 20)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 5),
                    child: Text("${currentUser?.email}",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.grey)),
                  ),
                  SizedBox(height: 220),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Account Created On : ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 124, 124),
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        Text("${currentUser?.creationDate}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey, fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
