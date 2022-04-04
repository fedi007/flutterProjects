import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Conduct extends StatefulWidget {
  const Conduct({ Key? key }) : super(key: key);

  @override
  State<Conduct> createState() => _ConductState();
}

class _ConductState extends State<Conduct> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffF7B30C),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Welcome",
                  style: TextStyle(
                    fontSize: 40,
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
