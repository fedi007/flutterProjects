import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iblaze/Models/offre.dart';
import '../../services/userServices/Offre_Api.dart';
import '../../services/userServices/Register_Login.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  // List<OffreModel> offre = [];

  // void main() async {
  //   offre = await APIOffre.getOffers(Name);
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => APIOffre.getOffers(Name));

    //  main();
  }

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
                  subtitle: Text(
                      offre[index].getDepart + " " + offre[index].getDepart),
                  children: [
                    ListTile(
                      title: Text(
                          "Departure Location : " + offre[index].getDepart),
                    ),
                    ListTile(
                      title:
                          Text("Arrival Location : " + offre[index].getArrivee),
                    ),
                    ListTile(
                      title:
                          Text("Freight Type : " + offre[index].getFreightType),
                    ),
                    ListTile(
                      title: Text("Quantity : " + offre[index].getQuantity),
                    ),
                    ListTile(
                      title: Text(
                          "delivery time : " + offre[index].getDeliveryTime),
                    ),
                    ListTile(
                      title: Text(offre[index].getResponse),
                    ),
                    ListTile(
                      title: Text("Edit",
                          style: TextStyle(color: Color(0xFF005b71))),
                      trailing: Icon(Icons.edit, color: Color(0xFF005b71)),
                    ),
                    ListTile(
                      onTap: () async {
                        APIOffre.deleteOffre(offre[index].getId);
                        if (offreCheck) {
                          setState(() {
                            offre.remove(offre[index]);
                          });
                          Fluttertoast.showToast(
                            msg: "Your Offre Has been Deleted",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Color(0xFF007097),
                            textColor: Colors.white,
                            fontSize: 16,
                          );
                        }
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
