import 'package:flutter/material.dart';
import 'package:iblaze/data/globals.dart';

import '../../../Models/offre.dart';
import '../../../Widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = '';
  List<OffreModel> Offres = [];

  @override
  void initState() {
    super.initState();
    Offres = AllOffres;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 197, 188, 188),
        body: Column(
          children: [
            buildSearch(),
            Expanded(
              child: ListView.builder(
                  itemCount: Offres.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
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
                                  text: Offres[index].getArrivee,
                                  style: new TextStyle(
                                      fontSize: 18, color: Color(0xFF005b71))),
                              new TextSpan(
                                  style: new TextStyle(
                                    color: Colors.black,
                                  ),
                                  text: ' To '),
                              new TextSpan(
                                  text: Offres[index].getDepart,
                                  style: new TextStyle(
                                      fontSize: 18, color: Color(0xFF005b71))),
                            ],
                          )),
                          children: [
                            Container(
                              height: 20,
                              child: ListTile(
                                title: Text(
                                    "Client Name : " + Offres[index].getName),
                              ),
                            ),
                            Container(
                              height: 20,
                              child: ListTile(
                                title: Text("Departure Location : " +
                                    Offres[index].getDepart),
                              ),
                            ),
                            Container(
                              height: 20,
                              child: ListTile(
                                title: Text("Arrival Location : " +
                                    Offres[index].getArrivee),
                              ),
                            ),
                            Container(
                              height: 20,
                              child: ListTile(
                                title: Text("Freight Type : " +
                                    Offres[index].getFreightType),
                              ),
                            ),
                            Container(
                              height: 20,
                              child: ListTile(
                                title: Text(
                                    "Quantity : " + Offres[index].getQuantity),
                              ),
                            ),
                            Container(
                              height: 20,
                              child: ListTile(
                                title: Text("delivery time : " +
                                    Offres[index].getDeliveryTime),
                              ),
                            ),
                            Container(
                              child: ListTile(
                                title: Text(Offres[index].getResponse),
                              ),
                            ),

                            // ListTile(
                            //   title: Text("Edit",
                            //       style: TextStyle(color: Color(0xFF005b71))),
                            //   trailing: Icon(Icons.edit, color: Color(0xFF005b71)),
                            // ),
                            // ListTile(
                            //   onTap: () async {
                            //     await APIOffreUser.deleteOffre(
                            //         offreByName[index].getId);
                            //     if (deletedOffre) {
                            //       setState(() {
                            //         offreByName.remove(offreByName[index]);
                            //       });
                            //       Get.defaultDialog(
                            //           title: "Done",
                            //           titleStyle: TextStyle(
                            //               fontSize: 30,
                            //               color: Color.fromARGB(255, 10, 101, 13)),
                            //           middleText: "Your offer has been deleted !",
                            //           middleTextStyle: TextStyle(
                            //               color: Color(0xFF005b71), fontSize: 20));
                            //     } else {
                            //       Get.defaultDialog(
                            //           title: "Error",
                            //           titleStyle:
                            //               TextStyle(fontSize: 30, color: Colors.red),
                            //           middleText: "Something went wrong !",
                            //           middleTextStyle: TextStyle(
                            //               color: Color(0xFF005b71), fontSize: 20));
                            //     }
                            //   },
                            //   title:
                            //       Text("Delete", style: TextStyle(color: Colors.red)),
                            //   trailing: Icon(Icons.delete, color: Colors.red),
                            // ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search by Loation',
        onChanged: searchOffre,
      );
  void searchOffre(String query) async {
    final Offres = await  AllOffres.where((Offres) {
      final depart = Offres.getDepart.toLowerCase();
      final arrive = Offres.getArrivee.toLowerCase();
      final search = query.toLowerCase();

      return depart.contains(depart) || arrive.contains(arrive);
    }).toList();

    setState(() {
      this.query = query;
      this.Offres = Offres;
    });
  }
}
