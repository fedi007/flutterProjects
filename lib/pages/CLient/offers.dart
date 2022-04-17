import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iblaze/Models/offre.dart';
import 'package:iblaze/data/globals.dart';
import '../../services/userServices/Offre_Api.dart';
import '../../services/userServices/Register_Login.dart';
import 'updateOffer.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  List<OffreModel> offers = [];
  @override
  void initState() {
    super.initState();

    init();
  }

  void init() async {
    final offersp = await APIOffreUser.getOffers(currentUser?.id);
    if (offersp != null) {
      setState(() {
        offers = offersp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 197, 188, 188),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(62, 0, 90, 113),
                  Color.fromARGB(62, 255, 255, 255),
                ]),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: offers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: ExpansionTile(
                          title: new RichText(
                              text: new TextSpan(
                            children: <TextSpan>[
                              // new TextSpan(
                              //     style: new TextStyle(
                              //       color: Colors.black,
                              //     ),
                              //     text: 'From '),
                              new TextSpan(
                                  text: offers[index].getDepart,
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Color(0xFF005b71),
                                    //fontWeight: FontWeight.bold
                                  )),
                              new TextSpan(
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  text: '    To     '),
                              new TextSpan(
                                  text: offers[index].getArrivee,
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Color(0xFF005b71),
                                    //fontWeight: FontWeight.bold
                                  )),
                            ],
                          )),
                          children: [
                            Container(
                              child: ListTile(
                                title: Text("Departure Location : " +
                                    offers[index].getDepart),
                              ),
                            ),
                            Container(
                              //height: 20,
                              child: ListTile(
                                title: Text("Arrival Location : " +
                                    offers[index].getArrivee),
                              ),
                            ),
                            Container(
                              // color    height: 20,
                              child: ListTile(
                                title: Text("Freight Type : " +
                                    offers[index].getFreightType),
                              ),
                            ),
                            Container(
                              //  height: 20,
                              child: ListTile(
                                title: Text(
                                    "Quantity : " + offers[index].getQuantity),
                              ),
                            ),
                            Container(
                              // height: 20,
                              child: ListTile(
                                title: Text("Delivery time : " +
                                    "${offers[index].getDeliveryTime}" +
                                    "  ${offers[index].getDeliveryDay}"),
                              ),
                            ),
                            Container(
                              child: ListTile(
                                title: Text(offers[index].getResponse),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Get.to(() => updateOffre(index: index));
                                print(index);
                              },
                              title: Text("Edit",
                                  style: TextStyle(color: Color(0xFF005b71))),
                              trailing:
                                  Icon(Icons.edit, color: Color(0xFF005b71)),
                            ),
                            ListTile(
                              onTap: () async {
                                Get.defaultDialog(
                                    title: "!",
                                    titleStyle: TextStyle(
                                        fontSize: 30, color: Colors.red),
                                    middleText:
                                        "Are you sure you want to delete this Offer ! \n ",
                                    middleTextStyle: TextStyle(fontSize: 20),
                                    textCancel: "Cancel",
                                    cancelTextColor: Colors.black,
                                    textConfirm: "Confirm",
                                    confirmTextColor: Colors.white,
                                    buttonColor: Colors.red,
                                    onConfirm: () async {
                                      await APIOffreUser.deleteOffre(
                                          offers[index].getOffreId);
                                      if (deletedOffre) {
                                        Get.back();
                                        setState(() {
                                          offers.remove(offers[index]);
                                        });
                                        Get.defaultDialog(
                                            title: "Done",
                                            titleStyle: TextStyle(
                                                fontSize: 30,
                                                color: Color.fromARGB(
                                                    255, 10, 101, 13)),
                                            middleText:
                                                "Your offer has been deleted !",
                                            middleTextStyle: TextStyle(
                                                color: Color(0xFF005b71),
                                                fontSize: 20));
                                      } else {
                                        Get.defaultDialog(
                                            title: "!",
                                            titleStyle: TextStyle(
                                                fontSize: 30,
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                            middleText:
                                                "Something went wrong !",
                                            middleTextStyle: TextStyle(
                                                color: Color(0xFF005b71),
                                                fontSize: 20));
                                      }
                                    });
                              },
                              title: Text("Delete",
                                  style: TextStyle(color: Colors.red)),
                              trailing: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
