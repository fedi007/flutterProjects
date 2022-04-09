import 'package:flutter/material.dart';

class AcceptedOffers extends StatefulWidget {
  const AcceptedOffers({Key? key}) : super(key: key);

  @override
  State<AcceptedOffers> createState() => _AcceptedOffersState();
}

class _AcceptedOffersState extends State<AcceptedOffers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("accepted offers Page", style: TextStyle(fontSize: 30))
            ]),
      )),
    );
  }
}
