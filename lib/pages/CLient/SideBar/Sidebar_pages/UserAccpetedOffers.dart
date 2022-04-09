import 'package:flutter/material.dart';


class UserAcceptedOffers extends StatefulWidget {
  const UserAcceptedOffers({ Key? key }) : super(key: key);

  @override
  State<UserAcceptedOffers> createState() => _UserAcceptedOffersState();
}

class _UserAcceptedOffersState extends State<UserAcceptedOffers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 197, 188, 188),
        body: ListView.builder(
            itemCount: 1 ,//offre.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                // child: ExpansionTile(
                //   title: new RichText(
                //       text: new TextSpan(
                //     children: <TextSpan>[
                //       new TextSpan(
                //           style: new TextStyle(
                //             color: Colors.black,
                //           ),
                //           text: 'From '),
                //       new TextSpan(
                //           text: offre[index].getArrivee,
                //           style: new TextStyle(
                //               fontSize: 18, color: Color(0xFF005b71))),
                //       new TextSpan(
                //           style: new TextStyle(
                //             color: Colors.black,
                //           ),
                //           text: ' To '),
                //       new TextSpan(
                //           text: offre[index].getDepart,
                //           style: new TextStyle(
                //               fontSize: 18, color: Color(0xFF005b71))),
                //     ],
                //   )),
                //   children: [
                //     Container(
                //       height: 20,
                //       child: ListTile(
                //         title: Text(
                //             "Departure Location : " + offre[index].getDepart),
                //       ),
                //     ),
                //     Container(
                //       height: 20,
                //       child: ListTile(
                //         title: Text(
                //             "Arrival Location : " + offre[index].getArrivee),
                //       ),
                //     ),
                //     Container(
                //       height: 20,
                //       child: ListTile(
                //         title: Text(
                //             "Freight Type : " + offre[index].getFreightType),
                //       ),
                //     ),
                //     Container(
                //       height: 20,
                //       child: ListTile(
                //         title: Text("Quantity : " + offre[index].getQuantity),
                //       ),
                //     ),
                //     Container(
                //       height: 20,
                //       child: ListTile(
                //         title: Text(
                //             "delivery time : " + offre[index].getDeliveryTime),
                //       ),
                //     ),
                //     Container(
                //       child: ListTile(
                //         title: Text(offre[index].getResponse),
                //       ),
                //     ),
                //     // ListTile(
                //     //   title: Text("Edit",
                //     //       style: TextStyle(color: Color(0xFF005b71))),
                //     //   trailing: Icon(Icons.edit, color: Color(0xFF005b71)),
                //     // ),
                //     ListTile(
                //       onTap: () async {
                //         await APIOffre.deleteOffre(offre[index].getId);
                //         if (deletedOffre) {
                //           setState(() {
                //             offre.remove(offre[index]);
                //           });
                //           Get.defaultDialog(
                //               title: "Done",
                //               titleStyle: TextStyle(fontSize: 30),
                //               middleText: "Your offer has been deleted !",
                //               middleTextStyle: TextStyle(
                //                   color: Color(0xFF005b71), fontSize: 20));
                //         } else {
                //           Get.defaultDialog(
                //               title: "Error",
                //               titleStyle: TextStyle(fontSize: 30),
                //               middleText: "Something went wrong !",
                //               middleTextStyle: TextStyle(
                //                   color: Color(0xFF005b71), fontSize: 20));
                //         }
                //       },
                //       title:
                //           Text("Delete", style: TextStyle(color: Colors.red)),
                //       trailing: Icon(Icons.delete, color: Colors.red),
                //     ),
                //   ],
                // ),
              );
            }),
      ),
    );
  }
}
