import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iblaze/Models/offre.dart';
import 'package:iblaze/data/globals.dart';

import '../../../services/conductorServices/conductorOffreAPI.dart';

class AcceptedOffers extends StatefulWidget {
  const AcceptedOffers({Key? key}) : super(key: key);

  @override
  State<AcceptedOffers> createState() => _AcceptedOffersState();
}

class _AcceptedOffersState extends State<AcceptedOffers> {
  List<UserOffers> offers = [];
  @override
  void initState() {
    super.initState();

    init();
  }

  void init() async {
    final offersp =
        await APIOffreConductor.offreCompleted(currentConductor?.conductorId);
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
                              new TextSpan(
                                  text: offers[index].getDepart,
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Color(0xFF005b71),
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
                                  )),
                            ],
                          )),
                          children: [
                            Container(
                              // height: 20,
                              child: ListTile(
                                title: Text("Departure Location : " +
                                    offers[index].getDepart),
                              ),
                            ),
                            Container(
                              // height: 20,
                              child: ListTile(
                                title: Text("Arrival Location : " +
                                    offers[index].getArrivee),
                              ),
                            ),
                            Container(
                              // height: 20,
                              child: ListTile(
                                title: Text("Freight Type : " +
                                    offers[index].getFreightType),
                              ),
                            ),
                            Container(
                              // height: 20,
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
                            Container(
                              // height: 20,
                              child: ListTile(
                                title: Text("Your price : " +
                                    "  ${offers[index].getPrice}"),
                              ),
                            ),
                            Container(
                              // height: 20,
                              child: ListTile(
                                title: Text("Your description : " +
                                    " ${offers[index].getDescription}"),
                              ),
                            ),
                            Container(
                              // height: 20,
                              child: ListTile(
                                title: Text("Used truck : " +
                                    "  ${offers[index].getTruckName}"),
                              ),
                            ),
                            Container(
                              // height: 20,
                              child: ListTile(
                                title: Text("Your offer has been accepted ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 57, 125, 59),
                                        fontSize: 18)),
                              ),
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
