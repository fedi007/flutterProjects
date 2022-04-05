import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Models/offre.dart';
import '../../services/userServices/Offre_Api.dart';
import '../../services/userServices/Register_Login.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  // late List<OffreModel> _offers;
  // late bool _Loading;

  // @override
  // void initState() {
  //   super.initState();
  //   _Loading = true;
  //   APIOffre.getOffers(Name).then((offers) {
  //     setState(() {
  //       _offers = offers;
  //       _Loading = false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 197, 188, 188),
        body: ListView.builder(
            itemCount: offre.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ExpansionTile(
                  title: new RichText(
                      text: new TextSpan(
                    children: <TextSpan>[
                      new TextSpan(
                          style: new TextStyle(
                            color: Colors.black,
                          ),
                          text: 'From '),
                      new TextSpan(
                          text: offre[index].getArrivee,
                          style: new TextStyle(
                              fontSize: 18, color: Color(0xFF005b71))),
                      new TextSpan(
                          style: new TextStyle(
                            color: Colors.black,
                          ),
                          text: ' To '),
                      new TextSpan(
                          text: offre[index].getDepart,
                          style: new TextStyle(
                              fontSize: 18, color: Color(0xFF005b71))),
                    ],
                  )),
                  subtitle: Text(offre[index].getDepart +
                      " " +
                      offre[index].getFreightType),
                  children: [
                    ListTile(
                      title: Text(
                          "Departure Location : " + offre[index].getDepart),
                    ),
                    // ListTile(
                    //   title: Text("Arrival Location : " + getArrivee[index]),
                    // ),
                    // ListTile(
                    //   title: Text("Freight Type : " + getFreightType[index]),
                    // ),
                    // ListTile(
                    //   title: Text("Quantity : " + getQuantity[index]),
                    // ),
                    // ListTile(
                    //   title:
                    //       Text("delivery time : " + getDeliveryTime[index]),
                    // ),
                    // ListTile(
                    //   title: Text(getResponse[index]),
                    // ),
                    ListTile(
                      title: Text("Edit",
                          style: TextStyle(color: Color(0xFF005b71))),
                      trailing: Icon(Icons.edit, color: Color(0xFF005b71)),
                    ),
                    ListTile(
                      onTap: () async {
                        APIOffre.deleteOffre(offre[index].getId);
                        //APIOffre.getOffers(Name);

                        Fluttertoast.showToast(
                          msg: "Your Offre Has been Deleted",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Color(0xFF007097),
                          textColor: Colors.white,
                          fontSize: 16,
                        );
                      },
                      title:
                          Text("Delete", style: TextStyle(color: Colors.red)),
                      trailing: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
