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
                 ButtonWidget(
                    text: "LOGIN",
                    onClicked: () async {
                      await APIOffre.GetFreight();
                    }),
              
            ]))),
      ),
    );
  }
}
