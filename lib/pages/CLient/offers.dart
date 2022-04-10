import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iblaze/Models/offre.dart';
import 'package:iblaze/data/globals.dart';
import '../../services/userServices/Offre_Api.dart';
import '../../services/userServices/Register_Login.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  void initState() {
    super.initState();
    // APIOffre.getOffers(currentUser?.username);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 197, 188, 188),
        body: ListView.builder(
            itemCount: currentOffre.length,
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
                          text: currentOffre[index].getArrivee,
                          style: new TextStyle(
                              fontSize: 18, color: Color(0xFF005b71))),
                      new TextSpan(
                          style: new TextStyle(
                            color: Colors.black,
                          ),
                          text: ' To '),
                      new TextSpan(
                          text: currentOffre[index].getDepart,
                          style: new TextStyle(
                              fontSize: 18, color: Color(0xFF005b71))),
                    ],
                  )),
                  children: [
                    Container(
                      height: 20,
                      child: ListTile(
                        title: Text("Departure Location : " +
                            currentOffre[index].getDepart),
                      ),
                    ),
                    Container(
                      height: 20,
                      child: ListTile(
                        title: Text("Arrival Location : " +
                            currentOffre[index].getArrivee),
                      ),
                    ),
                    Container(
                      height: 20,
                      child: ListTile(
                        title: Text("Freight Type : " +
                            currentOffre[index].getFreightType),
                      ),
                    ),
                    Container(
                      height: 20,
                      child: ListTile(
                        title: Text(
                            "Quantity : " + currentOffre[index].getQuantity),
                      ),
                    ),
                    Container(
                      height: 20,
                      child: ListTile(
                        title: Text("delivery time : " +
                            currentOffre[index].getDeliveryTime),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: Text(currentOffre[index].getResponse),
                      ),
                    ),
                    // ListTile(
                    //   title: Text("Edit",
                    //       style: TextStyle(color: Color(0xFF005b71))),
                    //   trailing: Icon(Icons.edit, color: Color(0xFF005b71)),
                    // ),
                    ListTile(
                      onTap: () async {
                        await APIOffre.deleteOffre(currentOffre[index].getId);
                        if (deletedOffre) {
                          setState(() {
                            currentOffre.remove(currentOffre[index]);
                          });
                          Get.defaultDialog(
                              title: "Done",
                              titleStyle: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 10, 101, 13)),
                              middleText: "Your offer has been deleted !",
                              middleTextStyle: TextStyle(
                                  color: Color(0xFF005b71), fontSize: 20));
                        } else {
                          Get.defaultDialog(
                              title: "Error",
                              titleStyle:
                                  TextStyle(fontSize: 30, color: Colors.red),
                              middleText: "Something went wrong !",
                              middleTextStyle: TextStyle(
                                  color: Color(0xFF005b71), fontSize: 20));
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
