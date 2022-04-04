import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/userServices/Offre_Api.dart';
import '../../services/userServices/Register_Login.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 197, 188, 188),
        body: RefreshIndicator(
          onRefresh: () async {
            APIOffre.getOffers(Name);
          },
          child: ListView.builder(
              itemCount: offreCount,
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
                            text: getDepart[index],
                            style: new TextStyle(
                                fontSize: 18, color: Color(0xFF005b71))),
                        new TextSpan(
                            style: new TextStyle(
                              color: Colors.black,
                            ),
                            text: ' To '),
                        new TextSpan(
                            text: getArrivee[index],
                            style: new TextStyle(
                                fontSize: 18, color: Color(0xFF005b71))),
                      ],
                    )),
                    subtitle:
                        Text(getQuantity[index] + " " + getFreightType[index]),
                    children: [
                      ListTile(
                        title: Text("Departure Location : " + getDepart[index]),
                      ),
                      ListTile(
                        title: Text("Arrival Location : " + getArrivee[index]),
                      ),
                      ListTile(
                        title: Text("Freight Type : " + getFreightType[index]),
                      ),
                      ListTile(
                        title: Text("Quantity : " + getQuantity[index]),
                      ),
                      ListTile(
                        title:
                            Text("delivery time : " + getDeliveryTime[index]),
                      ),
                      ListTile(
                        title: Text(getResponse[index]),
                      ),
                      ListTile(
                        title: Text("Edit",
                            style: TextStyle(color: Color(0xFF005b71))),
                        trailing: Icon(Icons.edit, color: Color(0xFF005b71)),
                      ),
                      ListTile(
                        onTap: () async {
                          APIOffre.deleteOffre(getId[index]);
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
      ),
    );
  }
}
