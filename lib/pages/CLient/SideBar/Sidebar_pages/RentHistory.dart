import 'package:flutter/material.dart';

class RentHistory extends StatelessWidget {
  const RentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RentHistory'),
        centerTitle: true,
        backgroundColor: Color(0xFF005b71),
      ),
    );
  }
}
