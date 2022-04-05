import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iblaze/Widgets/button_widget.dart';
import 'package:iblaze/pages/Register_page.dart';
import '../services/userServices/Offre_Api.dart';
import '../services/userServices/register_login.dart';
import 'Client/TruckMachine_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordObscured = true;
  late TextEditingController emailController, passwordController;
  var password;
  var userName;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => APIOffre.GetFreight());
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                    tag: "blaze",
                    child:
                        Image.asset("images/Lg.png", height: 140, width: 140)),
                SizedBox(height: 80),
                Center(
                    child: Center(
                        child: Container(
                            child: Text("SIGN IN",
                                style: GoogleFonts.roboto(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff007097)))))),
                SizedBox(height: 50),
                TextFormField(
                  cursorColor: Color(0xFF005b71),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF005b71)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: "Username",
                    labelStyle: TextStyle(color: Color(0xff007097)),
                    prefixIcon: Icon(Icons.person, color: Color(0xFF005b71)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    userName = value;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  cursorColor: Color(0xFF005b71),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF005b71)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Color(0xff007097)),
                    prefixIcon: Icon(Icons.vpn_key, color: Color(0xFF005b71)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordObscured = !passwordObscured;
                        });
                      },
                      icon: Icon(
                          passwordObscured
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xff007097)),
                    ),
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: passwordObscured,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, right: 15),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text("Forget Password?",
                          style: TextStyle(
                            color: Color(0xFF005b71),
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ButtonWidget(
                    text: "LOGIN",
                    onClicked: () async {
                      await APIService.login(userName, password);

                      if (test) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TruckMachine()));
                      } else {
                        Get.defaultDialog(
                            title: "Error",
                            titleStyle: TextStyle(fontSize: 30),
                            middleText: "Invalid Username/Email !",
                            middleTextStyle: TextStyle(
                                color: Color(0xFF005b71), fontSize: 20));
                      }
                    }),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have Any Account ?  ",
                        style: TextStyle(fontSize: 17.5),
                      ),
                      GestureDetector(
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                              color: Color(0xFF005b71), fontSize: 17.5),
                        ),
                        onTap: () {
                          Get.to(() => RegisterPage(),
                              transition: Transition.rightToLeft);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
