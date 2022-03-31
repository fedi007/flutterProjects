import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iblaze/services/userServices/register_login.dart';
import 'package:iblaze/services/userServices/Offre_Api.dart';

import 'Widgets/button_widget.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
                child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 40,
                width: 600,
                child: ButtonWidget(
                    text: "LOGIN",
                    onClicked: () async {
                      await APIOffre.GetFreight();
                    }),
              ),
            ]))),
      ),
    );
  }
}
