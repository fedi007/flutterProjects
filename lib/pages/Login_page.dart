import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iblaze/pages/Register.dart';
import 'package:iblaze/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordObscured = true;
  var password;
  var userName;
  bool test = false;

  Login(username, password) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('http://10.0.2.2:4000/users/login'));
    request.body = json.encode({"username": userName, "password": password});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      test = true;
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
      test = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 300,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //margin: EdgeInsets.only(top: 10),
                  child: Image.asset(
                    "images/Lg.png",
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            )),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
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
                hintText: "Username",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (value) {
                userName = value;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
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
                hintText: "Password",
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
              onChanged: (value) {
                password = value;
              },
              obscureText: passwordObscured,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                // Write Click Listener Code Here
              },
              child: Text("Forget Password?",
                  style: TextStyle(color: Color(0xFF005b71))),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await Login(userName, password);

              if (test) {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Welcome()),
                );
              }
             
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [(new Color(0xFF005b71)), new Color(0xFF007097)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have Any Account?  "),
                GestureDetector(
                  child: Text(
                    "Register Now",
                    style: TextStyle(color: Color(0xFF005b71)),
                  ),
                  onTap: () {
                    
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ));
                    
                   
                  },
                )
              ],
            ),
          )
        ],
      ))),
    );
  }
}
